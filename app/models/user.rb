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
  
  has_many :plans, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favplans, through: :favorites, source: :plan, dependent: :destroy
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow, dependent: :destroy
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user, dependent: :destroy
  
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
  
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
end
