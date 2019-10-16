class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules
  
  validates :plan_title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
end
