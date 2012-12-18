class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  attr_accessible :content, :public

  delegate :email, to: :user, prefix: true

  def self.current
    order("created_at DESC")
  end
end
