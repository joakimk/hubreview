class GithubsController < ApplicationController
  def create
    params[:commits].each do |commit|
      Revision.create! name: commit[:id], author: commit[:author][:name]
    end

    render text: "success"
  end
end
