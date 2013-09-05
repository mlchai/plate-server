class Problem < ActiveRecord::Base
  acts_as_commentable
  acts_as_votable
end
