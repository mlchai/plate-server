require 'spec_helper'

describe CommentsController do
  let!(:user) { FactoryGirl.create :user }
  let!(:problem) { FactoryGirl.create :problem }
  before do
    sign_in user
  end

  describe 'GET /Comments' do
    it 'returns all Comments'

    it 'accepts params for searching'
  end

  describe 'POST /Comments' do
    it 'creates a Comment with the given params' do
      post :create, {:comment => {:title => 'test', :comment => 'testestsetstt', :commentable_id => problem.id,
        :commentable_type => problem.class}}
      json = JSON.parse response.body
      json['id'].should_not be_nil
    end
  end

  describe 'PUT /Comments/:id' do
    let!(:comment) { FactoryGirl.create :comment }

    it 'updates a comment' do
      put :update, {:id => comment.id, :comment => {:title => 'changed'}}
      comment.reload.title.should == 'changed'
    end
  end
end
