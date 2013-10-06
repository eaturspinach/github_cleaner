class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.datetime :repo_creation_date
      t.references :user
      t.timestamps
    end
  end
end
