class User < ApplicationRecord
  validates :name, presence:true
  validates :email, presence:true
  before_validation{email.downcase!}
  has_secure_password
end
