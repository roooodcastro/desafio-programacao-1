# frozen_string_literal: true

class Purchaser < ApplicationRecord
  has_many :purchase_items

  validates :name, presence: true, uniqueness: true
end
