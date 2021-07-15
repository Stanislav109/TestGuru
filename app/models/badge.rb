class Badge < ApplicationRecord
  TYPES_OF_BADGES = %i[all_by_category first_try all_by_level]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image_url, :rule, presence: true
  validates :name, uniqueness: true
end
