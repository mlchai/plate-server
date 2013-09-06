require 'spec_helper'

describe CommentsController do
  let!(:user) { FactoryGirl.create :user }
  let!(:problem) { FactoryGirl.create :problem }
  before do
    sign_in user
  end

  describe 'destroy /comments/:id' do
    let!(:comment) { FactoryGirl.create :comment }
    it 'deletes a specified comment' do
      expect {
        delete :destroy, {:id => comment.id}
      }.to change(Comment, :count).by(-1)
    end
  end

  describe 'POST /Comments' do
    it 'creates a Comment with the given params' do
      post :create, {:comment => {:title => 'test', :comment => 'testestsetstt', :commentable_id => problem.id,
        :commentable_type => problem.class}}
      json = JSON.parse response.body
      json['id'].should_not be_nil
      problem.comments.count.should_not == 0
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
