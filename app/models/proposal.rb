class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :cooker, class_name: 'User'
  has_many :proposal_items
  accepts_nested_attributes_for :proposal_items

  def calculate_total_price
    total_price = 0
    self.proposal_items.each do |proposal_item|
      total_price += (proposal_item.quantity * proposal_item.price)
    end

    self.total_price = total_price
  end
end
