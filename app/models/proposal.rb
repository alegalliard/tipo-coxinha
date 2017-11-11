class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :cooker, class_name: 'User'
  has_many :proposal_items
  accepts_nested_attributes_for :proposal_items
end
