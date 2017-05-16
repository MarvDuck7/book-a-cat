class Cat < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, length: {maximum: 50}, presence: true

  validates :description, presence: true
  validates :address, length: {maximum: 560}, presence: true
  validates :price, numericality: { only_integer: true }, presence: true
end
