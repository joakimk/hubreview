class AddBranchToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :branch, :string

    Revision.all.each do |revision|
      revision.branch = revision.payload["ref"].split("/").last
      revision.save!
    end
  end
end
