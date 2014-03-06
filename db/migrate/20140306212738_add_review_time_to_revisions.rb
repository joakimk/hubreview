class AddReviewTimeToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :review_time, :integer, null: true
  end
end
