class MaterialReserf < ApplicationRecord
  mount_uploader :image_one, ImageUploader
  mount_uploader :image_two, ImageUploader
  mount_uploader :image_three, ImageUploader
  mount_uploader :image_four, ImageUploader
  mount_uploader :image_five, ImageUploader
  mount_uploader :image_six, ImageUploader
  mount_uploader :image_seven, ImageUploader
  mount_uploader :image_eight, ImageUploader
  mount_uploader :image_nine, ImageUploader
  mount_uploader :image_ten, ImageUploader
  belongs_to :enterprise
  has_many :goods
  has_many :warns
  has_many :cars
end
