class Cat < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true

  validates :description, :address, presence: true

  validates :price, numericality: { only_integer: true }, presence: true
end
