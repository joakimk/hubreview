class GithubsController < ApplicationController
  def create
    if payload.has_key?(:zen)
      handle_ping
    else
      create_commits
    end
  end

  private

  def payload
    @payload ||= HashWithIndifferentAccess.new(JSON.parse(params[:payload]))
  end

  def handle_ping
    render text: "Pong!"
  end

  def create_commits
    payload[:commits].each do |commit|
      revision = Revision.where(name: commit[:id]).first_or_initialize
      revision.attributes = {
        name:         commit[:id],
        author:       commit[:author][:name],
        author_email: commit[:author][:email],
        project_name: payload[:repository][:name],
        url:          commit[:url],
        message:      commit[:message],
        branch:       payload["ref"].split("/").last,
        payload:      payload,
      }

      revision.save!

      PushRevisionChange.push(revision, self)
    end

    render text: "success"
  end
end
