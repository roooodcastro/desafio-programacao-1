# frozen_string_literal: true

class MerchantBranch < ApplicationRecord
  belongs_to :merchant

  validates :address, presence: true, uniqueness: true
  validates :merchant, presence: true
end
