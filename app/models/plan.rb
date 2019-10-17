class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy, inverse_of: :plan
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true
  
  validates :plan_title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
end
