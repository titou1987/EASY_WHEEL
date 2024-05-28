class Bike < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :user
  has_many :rentals
end
