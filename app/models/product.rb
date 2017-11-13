class Product < ApplicationRecord
  belongs_to :category
  belongs_to :delivery_type
  belongs_to :unity
  belongs_to :user

  validates :name, :price, :category_id,
            :delivery_type_id, :unity_id, presence: true
end
