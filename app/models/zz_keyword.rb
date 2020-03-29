class Keyword < ApplicationRecord
  validates :name,presence:true,length:{maximum:30}
  
  has_many :plans_keywords, dependent: :destroy
  has_many :plans, through: :plans_keywords, dependent: :destroy
end
