class AddDescriptionAndFollowersAndWatchersCountToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :description, :text
    add_column :repositories, :followers, :integer
    add_column :repositories, :watchers_count, :integer
  end
end
