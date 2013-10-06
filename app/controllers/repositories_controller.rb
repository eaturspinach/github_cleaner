class RepositoriesController < ApplicationController
  
  def index
    repos = Repository.get_repos(User.find(4)) # hard-coded for now
    render :json => {"repositories" => repos.as_json}
  end

  def show
    user = User.find(User.find(1)) # hard-coded for now
    repos = Github::Repos.new
    repository = user.repositories.where(:id => params[:id]).first
    github_data = Github.repos.get(user.nickname,repository.name)
    repo_hash = {
        "info" => repository,
        "description" => repository.description,
        "followers" => repository.followers,
        "watchers_count" => repository.watchers_count
    }
    render :json => {"repository" => repo_hash}
  end

  def destroy
    repoIds = params[:repos]
    puts "repos are #{repoIds}"
    repoIds.each do |repoId|
      Repository.find(repoId).destroy
    end
    render :nothing => true
  end

end
