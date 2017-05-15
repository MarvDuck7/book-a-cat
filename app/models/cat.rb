class Cat < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, format: { with: /\d?*[a-zA-Z]+\d*?/, message: "only allows letters" }, presence: true

  validates :description, :address, presence: true

  validates :price, numericality: { only_integer: true }, presence: true
end
