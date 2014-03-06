class RevisionsController < ApplicationController
  def index
  end

  def update
    revision = Revision.find(params[:id])

    if params[:in_review]
      revision.in_review_at = Time.now
    else
      revision.reviewed = !revision.reviewed
    end

    revision.save!

    PushRevisionChange.push(revision, self)
    render text: "success"
  end
end
