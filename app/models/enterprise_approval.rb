class EnterpriseApproval < ApplicationRecord
  mount_uploader :business_license, ImageUploader
  mount_uploader :business_processing_license, ImageUploader
  mount_uploader :food_distribution_license, ImageUploader
  mount_uploader :warehouse_photos_one, ImageUploader
  mount_uploader :warehouse_photos_two, ImageUploader
  mount_uploader :warehouse_photos_three, ImageUploader
end
