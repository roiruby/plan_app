class City < ApplicationRecord
  belongs_to :prefecture, optional: true
  has_many :spots, ->{ order(:id) }, dependent: :destroy
  has_many :plans, dependent: :destroy
end
