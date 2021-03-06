class Contact include ActiveModel::Model

  attr_accessor :name, :email, :content, :category

  validates :name, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :content, presence: true, length: { maximum: 700 }
end