class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cats, through: :bookings, dependent: :destroy

  validates :first_name, :last_name, :address, :password, presence: true
  validates :email, presence: true
end
