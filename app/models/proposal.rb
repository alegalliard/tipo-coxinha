class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :cooker, class_name: 'User'
  has_many :proposal_items, dependent: :destroy
  accepts_nested_attributes_for :proposal_items
  before_save :calculate_total_price

  validates :delivery_date_time,
            :proposal_items, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2 }

  def calculate_total_price
    total_price = 0
    if proposal_items.any?
      proposal_items.each do |proposal_item|
        total_price += (proposal_item.quantity * proposal_item.price)
      end
    end

    self.total_price = total_price
  end
end
