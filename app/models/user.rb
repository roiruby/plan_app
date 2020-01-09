class User < ApplicationRecord
  
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest

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
  
  has_many :information
  

  
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
      Relationship.send_follow_email(other_user, self)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  
  private
  def downcase_email
    self.email = email.downcase
  end
  
  def create_activation_digest
    self.activation_token   =   User.new_token
    self.activation_digest  =   User.digest(activation_token)
  end

  
end
