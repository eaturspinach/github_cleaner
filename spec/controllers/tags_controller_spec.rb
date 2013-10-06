require 'spec_helper'

describe TagsController do

  before(:each) do
    @repository = FactoryGirl.create(:repository)
    @tag = FactoryGirl.build(:tag)
  end

  describe "GET 'create'" do
    it "returns success if creation is successful" do
      get 'create', :repo_id => @repository.id, :tag => @tag.name
      response.status.should == 200
    end

    it "returns forbidden if creation is not successful" do
      get 'create', :repo_id => @repository.id, :tag => nil
      response.status.should == 403
    end

  end

end
