class PackingListItem < ApplicationRecord
  belongs_to :trip

  VALID_CATEGORIES = ['Clothing', 'Electronics', 'Leisure', 'Toiletries', 'Documents', 'Misc.'].freeze

  validates :category, inclusion: { in: VALID_CATEGORIES, message: "%{value} is not a valid category" }
end
