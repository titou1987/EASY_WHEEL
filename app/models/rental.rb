class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :status, inclusion: { in: %w[approved pending declined]}
end
