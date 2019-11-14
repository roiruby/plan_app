class Prefecture < ApplicationRecord
  has_many :cities, ->{ order(:id) }, dependent: :destroy
end
