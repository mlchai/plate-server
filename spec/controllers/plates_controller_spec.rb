require 'spec_helper'

describe PlatesController do
  let!(:user) { FactoryGirl.create :user }
  let!(:plate) { FactoryGirl.create :plate }
  before do
    sign_in user
  end

  describe 'POST /plates/:id/add_problem' do
    let!(:problem) { FactoryGirl.create :problem }
    it 'adds problems to plates' do
      post :add_problem, {:id => plate.id, :problem_id => problem.id}
      plate.problems.count.should_not == 0
    end
  end

  describe 'GET /plates' do
    it 'returns all plates' do
      get :index
      assigns(:plates).should == [plate]
    end

    it 'accepts params for searching' do
      get :index, {}
      assigns(:plates).should == [plate]
    end
  end

  describe 'POST /plates' do
    it 'creates a plate with the given params' do
      post :create, {:plate => {:name => 'hello', :description => 'hello'}}
      json = JSON.parse response.body
      json['id'].should_not be_nil
    end
  end

  describe 'PUT /plates/:id' do 
    it 'updates a plate' do
      put :update, {:id => plate.id, :plate => {:name => 'changed'}}
      plate.reload.name.should == 'changed'
    end
  end
end
