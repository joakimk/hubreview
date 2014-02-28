class AddColumnsToRevisions < ActiveRecord::Migration
  def change
    change_column :revisions, :author, :string, null: false
    change_column :revisions, :name, :string, null: false
    add_column :revisions, :payload, :text, null: false
    add_column :revisions, :url, :string, null: false
    add_column :revisions, :message, :string, null: false
    add_column :revisions, :reviewed, :boolean, default: false
  end
end
