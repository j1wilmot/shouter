class Shout < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body

  def self.current
    order("create_at DEC")
  end
end
