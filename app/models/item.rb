# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :purchases

  validates :name, presence: true, uniqueness: true
end
