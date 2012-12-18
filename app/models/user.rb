class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts, dependent: :destroy

  has_many :followed_user_relationships, foreign_key: :follower_id, class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships, foreign_key: :followed_user_id, class_name: "FollowingRelationship"
  has_many :followers, through: :follower_relationships

  def can_follow?(user)
    self_and_followed_user_ids.exclude?(user.id)
  end

  def timeline
    Timeline.new(self_and_followed_user_shouts)
  end

  def public_timeline
    PublicTimeline.new(Timeline.new(shouts))
  end

  def private_timeline
    Timeline.new(private_shouts)
  end

  def build_shout content, public
    shouts.new(content: content, public: public)
  end

  def follow user
    followed_users << user
  end

  def following? user
    followed_user_ids.include? user.id
  end

  private

  def private_shouts
    shouts.where(public: true)
  end

  def self_and_followed_user_shouts
    Shout.where(user_id: self_and_followed_user_ids)
  end

  def self_and_followed_user_ids
    [id] + followed_user_ids
  end

end
