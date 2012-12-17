class PhotoShout < ActiveRecord::Base
  has_attached_file :image
  attr_accessible :image
end
