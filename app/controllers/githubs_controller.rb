class GithubsController < ApplicationController
  def create
    Rails.logger.error params.inspect
    render text: "success"
  end
end
