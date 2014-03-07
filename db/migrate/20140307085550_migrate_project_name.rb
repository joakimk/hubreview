class MigrateProjectName < ActiveRecord::Migration
  def up
    Revision.find_each do |rev|
      name = rev.payload.fetch("repository", {}).fetch("name", nil)
      rev.update_column(:project_name, name)
    end

    change_column :revisions, :project_name, :string, null: false
  end
end
