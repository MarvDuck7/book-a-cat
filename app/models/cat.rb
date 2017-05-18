class Cat < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_attachment :photo

  validates :name, length: { maximum: 50 }, presence: true

  validates :description, presence: true
  validates :address, length: { maximum: 560 }, presence: true
  validates :price, numericality: { only_integer: true }, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
