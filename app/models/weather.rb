class Weather < ApplicationRecord
  belongs_to :user

  validates :city_id, presence: true
  validates :city_name, presence: true
end
