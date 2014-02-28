class RevisionsController < ApplicationController
  def index
  end

  def update
    revision = Revision.find(params[:id])
    revision.reviewed = !revision.reviewed
    revision.save!
    redirect_to action: :index
  end
end
