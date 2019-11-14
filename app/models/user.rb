class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :catchphrase, length: { maximum: 100 }
  validates :introduce, length: { maximum: 255 }
  validates :password, length: { in: 6..20 }, allow_nil: true
  has_secure_password
  mount_uploader :image, ImageUploader
  
  has_many :plans
  
  has_many :favorites
  has_many :favplans, through: :favorites, source: :plan
  
  def like(plan)
    favorites.find_or_create_by(plan_id: plan.id)
  end

  def unlike(plan)
    favorite = favorites.find_by(plan_id: plan.id)
    favorite.destroy if favorite
  end

  def  favplan?(plan)
    self.favplans.include?(plan)
  end
  
end
