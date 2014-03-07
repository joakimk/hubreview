class AddProjectNameToRevisions < ActiveRecord::Migration
  def up
    add_column :revisions, :project_name, :string, null: true
  end
end
