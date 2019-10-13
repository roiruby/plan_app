class Plan < ApplicationRecord
  belongs_to :user
  
  validates :plan_title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
end
