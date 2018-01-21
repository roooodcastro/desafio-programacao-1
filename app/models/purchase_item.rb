# frozen_string_literal: true

class PurchaseItem < ApplicationRecord
  belongs_to :item
  belongs_to :purchase
  belongs_to :purchaser
  belongs_to :merchant_branch
  has_one    :merchant, through: :merchant_branch

  delegate :name, to: :purchaser, prefix: true
  delegate :name, to: :item, prefix: true
  delegate :name, to: :merchant, prefix: true
  delegate :address, to: :merchant_branch, prefix: true

  validates :item, :merchant_branch, :purchaser, :item_price, :item_count,
            :purchase, presence: true
  validates :item_price, :item_count, numericality: true

  def total_price
    item_price * item_count
  end
end
