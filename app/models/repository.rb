class Repository < ActiveRecord::Base
  attr_accessible :name, :tag_list, :url, :repo_creation_date, :description, :followers, :watchers_count
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  # Provides custom hash of repos
  def self.get_repos(user)
    repo_arr = []
    repo_hash = {}
    repositories = user.repositories
    repositories.each do |repo|
      repo_hash = {
        "id"                  => repo.id,
        "item"                => repo.id,
        "name"                => repo.name,
        "repo_creation_date"  => repo.repo_creation_date,
        "url"                 => repo.url,
        "description"         => repo.description,
        "followers"           => repo.followers,
        "watchers_count"      => repo.watchers_count
      }
      repo_arr << repo_hash
    end
    puts "repo_arr is #{repo_arr}"
    repo_arr
  end

	# Add a repo if it does not already exist
	def self.check_repos(user)
    repos = Github::Repos.new
    repo_list = repos.list(user: user.nickname,per_page: 10,page: 0)
    repo_list.each_page do |page|
      page.each do |repo|
        if !Repository.find_by_name(repo.name)
          user.repositories.create(:name => repo.name, 
            :url => repo.url, 
            :repo_creation_date => repo.created_at,
            :description => repo.description,
            :followers => repo.followers,
            :watchers_count => repo.watchers_count
          )
        end
      end
    end
	end

end
