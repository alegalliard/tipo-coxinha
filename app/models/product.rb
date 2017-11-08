class Product < ApplicationRecord
  belongs_to :category
  belongs_to :delivery_type
  belongs_to :unity
end
