class TagsController < ApplicationController
  
  def create
    repo_id = params[:repo_id] 
    
    if repo_id != nil
      tag = Repository.find(params[:repo_id]).tags.create(:name => params[:tag])
    end

    if tag.save
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 403
    end
  end

end
