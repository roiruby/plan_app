class Area < ApplicationRecord
  has_many :plans, dependent: :destroy
end
