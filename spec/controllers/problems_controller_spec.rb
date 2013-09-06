require 'spec_helper'

describe ProblemsController do
  let!(:user) { FactoryGirl.create :user }
  let!(:problem) { FactoryGirl.create :problem }
  before do
    sign_in user
  end

  describe 'GET /problems' do
    it 'returns all problems' do
      get :index
      assigns(:problems).should == [problem]
    end

  end

  describe 'POST /problems' do
    it 'creates a problem' do
      post :create, {:problem => {:name => 'test', :description => 'test'}}
      json = JSON.parse response.body
      json['id'].should_not be_nil
    end
  end

  describe 'PUT /problems/:id' do
    it 'updates a problem' do
      put :update, {:id => problem.id, :problem => {:name => 'changed'}}
      problem.reload.name.should == 'changed'
    end
  end
end
