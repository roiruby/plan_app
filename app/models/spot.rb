class Spot < ApplicationRecord
  has_many :plans, dependent: :destroy
  belongs_to :city, optional: true
end
