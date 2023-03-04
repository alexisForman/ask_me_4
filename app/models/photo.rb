class Photo < ApplicationRecord
  belongs_to :user

  has_one_attached :image_good_path
  has_one_attached :image_ordinary_path
  has_one_attached :image_bad_path
  
end
