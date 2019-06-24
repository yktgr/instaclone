class User < ApplicationRecord
  validates :name, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:true
  before_validation{email.downcase!}
  has_secure_password
  has_many :posts
  has_many:favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
