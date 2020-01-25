class PlansKeyword < ApplicationRecord
  belongs_to :plan
  belongs_to :keyword
end
