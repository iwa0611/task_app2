class User < ApplicationRecord
  validates :name,presence: true
  validates :email,presence: true,uniqueness: true
  validates :password_digest,presence: true,length: {minimum: 6},on: :create
  has_secure_password
  has_many :rooms
  mount_uploader :image, ImageUploader
end
