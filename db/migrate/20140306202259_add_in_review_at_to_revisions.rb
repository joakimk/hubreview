class AddInReviewAtToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :in_review_at, :datetime, null: true
  end
end
