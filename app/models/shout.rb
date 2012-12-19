class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  attr_accessible :content, :public

  delegate :email, to: :user, prefix: true

  def self.current
    order("created_at DESC")
  end

  def self.search params
    indices = SearchIndex.search(params)
    where(id: indices.select(:shout_id)) 
  end
end
