class TextShout < ActiveRecord::Base
  attr_accessible :body
  has_one :shout, as: :content

  def index
    body
  end
end
