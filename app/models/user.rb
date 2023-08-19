class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bills
  has_many :items
  has_one_attached :picture

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
