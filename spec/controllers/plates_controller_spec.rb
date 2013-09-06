require 'spec_helper'

describe PlatesController do
  let!(:user) { FactoryGirl.create :user }
  before do
    sign_in user
  end

  describe 'GET /plates' do
    it 'returns all plates'

    it 'accepts params for searching'
  end

  describe 'POST /plates' do
    it 'creates a plate with the given params' do
      post :create, {:plate => {:name => 'hello', :description => 'hello'}}
      json = JSON.parse response.body
      json['id'].should_not be_nil
    end
  end

  describe 'PUT /plates/:id' do
    it 'updates a plate'
  end
end
