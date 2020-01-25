class Area < ApplicationRecord
  has_many :plans, dependent: :destroy
  
  has_ancestry
end
