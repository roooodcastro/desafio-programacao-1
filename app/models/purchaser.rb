# frozen_string_literal: true

class Purchaser < ApplicationRecord
  has_many :purchases

  validates :name, presence: true, uniqueness: true
end
