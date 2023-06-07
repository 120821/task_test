class Region < ApplicationRecord
  has_many :managers
  has_many :warns
  has_many :cities
  has_many :enterprises, through: :managers
end
