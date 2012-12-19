class PhotoShout < ActiveRecord::Base
  has_attached_file :image
  has_one :shout, as: :content
  attr_accessible :image

  def index
    image_file_name
  end
end
