class Post < ApplicationRecord
  validates:title,presence:true,length:{maximum:20}
  validates:content,presence:true,length:{maximum:140}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many:favorites_users, through: :favorites, source: :user
  mount_uploader :image,ImageUploader
end
