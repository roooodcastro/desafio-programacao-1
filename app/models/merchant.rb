class Merchant < ApplicationRecord
  has_many :purchases
  has_many :merchant_branches

  validates :name, presence: true, uniqueness: true
end
