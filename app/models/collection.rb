class Collection < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
