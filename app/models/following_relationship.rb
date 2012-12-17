class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower
  belongs_to :followed_user
  # attr_accessible :title, :body
end
