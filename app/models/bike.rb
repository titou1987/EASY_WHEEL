class Bike < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  validates :bike_name, presence: true, uniqueness: true
  validates :type, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true
end
