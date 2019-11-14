class Spot < ApplicationRecord
  belongs_to :city, optional: true
end
