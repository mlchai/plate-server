class Problem < ActiveRecord::Base
  acts_as_commentable
  acts_as_votable

  has_and_belongs_to_many :plates
end
