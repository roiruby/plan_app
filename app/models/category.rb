class Category < ApplicationRecord
  has_many :plans, dependent: :destroy
end
