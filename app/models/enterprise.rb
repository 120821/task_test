class Enterprise < ApplicationRecord
  mount_uploader :business_license, ImageUploader
  mount_uploader :business_processing_license, ImageUploader
  mount_uploader :food_distribution_license, ImageUploader
  mount_uploader :warehouse_photos_one, ImageUploader
  mount_uploader :warehouse_photos_two, ImageUploader
  mount_uploader :warehouse_photos_three, ImageUploader
  mount_uploader :legal_person_image, ImageUploader
  has_many :goods_data_submissions
  has_many :daily_goods_statistics
  has_many :material_reserves
  has_many :goods
  has_many :cars
  has_many :warns
  has_many :enterprise_personnels, dependent: :delete_all
  belongs_to :manager
end
