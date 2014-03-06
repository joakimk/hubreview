class RevisionsController < ApplicationController
  def index
  end

  def update
    revision = Revision.find(params[:id])

    if params[:in_review]
      revision.in_review_at = Time.now
    else
      revision.reviewed = !revision.reviewed

      # Save how long it took to review a revision, just for fun
      if revision.reviewed && revision.in_review_at && !revision.review_time
        revision.review_time = Time.now - revision.in_review_at
      end
    end

    revision.save!

    PushRevisionChange.push(revision, self)
    render text: "success"
  end
end
