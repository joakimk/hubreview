class AddAuthorEmailToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :author_email, :string, null: true
    Revision.find_each do |rev|
      email = rev.payload.fetch("head_commit", {}).fetch("author", {}).fetch("email", nil)
      rev.update_column(:author_email, email)
    end
  end
end
