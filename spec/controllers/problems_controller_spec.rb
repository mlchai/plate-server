require 'spec_helper'

describe ProblemsController do
  let!(:user) { FactoryGirl.create :user }
  before do
    sign_in user
  end

  describe 'GET /problems' do
    it 'returns all problems'

  end

  describe 'POST /problems' do
    it 'creates a problem' do
      post :create, {:problem => {:name => 'test', :description => 'test'}}
      json = JSON.parse response.body
      json['id'].should_not be_nil
    end
  end
end
