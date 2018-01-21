# frozen_string_literal: true

class PurchaseBuilder
  attr_reader :row, :purchase_item, :purchase

  COL_PURCHASER = 0
  COL_ITEM_NAME = 1
  COL_ITEM_PRICE = 2
  COL_ITEM_COUNT = 3
  COL_MERCHANT_ADDRESS = 4
  COL_MERCHANT_NAME = 5

  def initialize(purchase, csv_row)
    @purchase = purchase
    @row = csv_row
    parse_row
  end

  delegate :save!, to: :purchase_item

  private

  attr_reader :purchaser, :merchant, :merchant_branch, :item

  def parse_row
    find_or_build_associations
    @purchase_item = build_purchase_item
  end

  def build_purchase_item
    PurchaseItem.new([purchaser: purchaser, merchant_branch: merchant_branch,
                      item: item, item_count: row[COL_ITEM_COUNT],
                      item_price: row[COL_ITEM_PRICE], purchase: purchase])
  end

  def find_or_build_associations
    @purchaser = find_or_build_purchaser
    @item = find_or_build_item
    @merchant = find_or_build_merchant
    @merchant_branch = find_or_build_merchant_branch
  end

  def find_or_build_purchaser
    purchaser = Purchaser.find_by(name: row[COL_PURCHASER])
    return purchaser if purchaser
    Purchaser.new(name: row[COL_PURCHASER])
  end

  def find_or_build_merchant
    merchant = Merchant.find_by(name: row[COL_MERCHANT_NAME])
    return merchant if merchant
    Merchant.new(name: row[COL_MERCHANT_NAME])
  end

  def find_or_build_merchant_branch
    branch = MerchantBranch.find_by(address: row[COL_MERCHANT_ADDRESS])
    return branch if branch
    MerchantBranch.new(address: row[COL_MERCHANT_ADDRESS], merchant: merchant)
  end

  def find_or_build_item
    item = Item.find_by(name: row[COL_ITEM_NAME])
    return item if item
    Item.new(name: row[COL_ITEM_NAME])
  end
end
