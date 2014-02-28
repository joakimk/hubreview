class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.string :name
      t.string :author

      t.timestamps
    end
  end
end
