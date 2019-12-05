class Prefecture < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :cities, ->{ order(:id) }, dependent: :destroy
end
