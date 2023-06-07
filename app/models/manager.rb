class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :enterprises
  has_many :goods_data_submissions
  has_many :goods, through: :enterprises
  has_many :enterprise_personnels, through: :enterprises
  has_many :cars, through: :enterprises
  has_many :daily_goods_statistics, through: :enterprises
  belongs_to :region, optional: true
  has_many :material_reserves, through: :enterprises
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  def to_trackable_array
    [current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip]
  end
end
