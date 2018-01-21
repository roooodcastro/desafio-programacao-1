class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :purchaser
  belongs_to :merchant_branch

  validates :item, :merchant_branch, :purchaser, :item_price, :item_count,
            presence: true

  class << self
    def create_from_csv!(csv_row)
      PurchaseBuilder.new(csv_row).save!
    end
  end
end
