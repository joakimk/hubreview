class GithubsController < ApplicationController
  def create
    payload = params[:payload]
    payload[:commits].each do |commit|
      Revision.create!(
        name: commit[:id],
        author: commit[:author][:name],
        url: commit[:url],
        message: commit[:message],
        payload: payload,
      )
    end

    render text: "success"
  end
end
