class Budget < ApplicationRecord
  has_many :plans, dependent: :destroy
end
