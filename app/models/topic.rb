class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validate :image_size

  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'

  mount_uploader :image, ImageUploader

 private
 def image_size
   if image.size > 5.megabytes
     errors.add(:picture, "5MB以上は投稿できません")
   end
 end
end
