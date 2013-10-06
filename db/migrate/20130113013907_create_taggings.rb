class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :repository_id

      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :repository_id
  end
end
