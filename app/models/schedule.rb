class Schedule < ApplicationRecord
  belongs_to :plan
  
  validates :schedule_title, length: { maximum: 50 }
  validates :sub_title, length: { maximum: 60 }
  validates :content, length: { maximum: 1000 }
  validates :spot_name, length: { maximum: 100 }
  validates :address, length: { maximum: 200 }
  validates :access, length: { maximum: 255 }
  validates :business_hour, length: { maximum: 255 }
  validates :regular_holiday, length: { maximum: 255 }
  validates :tel, length: { maximum: 200 }
  validates :parking, length: { maximum: 255 }
  validates :budget, length: { maximum: 255 }
  validates :comment, length: { maximum: 255 }
  
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
  
  
  
end

