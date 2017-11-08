class Product < ApplicationRecord
  belongs_to :category
  belongs_to :delivery_type
  belongs_to :unity

  validates :name, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :delivery_type_id, presence: true
  validates :unity_id, presence: true


end
