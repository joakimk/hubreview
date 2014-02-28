class GithubsController < ApplicationController
  def create
    Rails.logger.error params.inspect
  end
end
