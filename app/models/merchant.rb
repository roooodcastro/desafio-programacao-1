# frozen_string_literal: true

class Merchant < ApplicationRecord
  has_many :purchase_items, through: :merchant_branches
  has_many :merchant_branches

  validates :name, presence: true, uniqueness: true
end
