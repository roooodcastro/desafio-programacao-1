class PurchaseBuilder
  attr_reader :row, :purchase

  COL_PURCHASER = 0
  COL_ITEM_NAME = 1
  COL_ITEM_PRICE = 2
  COL_ITEM_COUNT = 3
  COL_MERCHANT_ADDRESS = 4
  COL_MERCHANT_NAME = 5

  def initialize(csv_row)
    @row = csv_row
    parse_row
  end

  def save!
    purchase.save!
  end

  private

  attr_reader :purchaser, :merchant, :merchant_branch, :item

  def parse_row
    get_or_build_associations
    @purchase = build_purchase
  end

  def build_purchase
    Purchase.new(purchaser: purchaser, merchant_branch: merchant_branch,
                 item: item, item_count: row[COL_ITEM_COUNT],
                 item_price: row[COL_ITEM_PRICE] )
  end

  def get_or_build_associations
    @purchaser = get_or_build_purchaser
    @item = get_or_build_item
    @merchant = get_or_build_merchant
    @merchant_branch = get_or_build_merchant_branch
  end

  def get_or_build_purchaser
    purchaser = Purchaser.find_by(name: row[COL_PURCHASER])
    return purchaser if purchaser
    Purchaser.new(name: row[COL_PURCHASER])
  end

  def get_or_build_merchant
    merchant = Merchant.find_by(name: row[COL_MERCHANT_NAME])
    return merchant if merchant
    Merchant.new(name: row[COL_MERCHANT_NAME])
  end

  def get_or_build_merchant_branch
    branch = MerchantBranch.find_by(address: row[COL_MERCHANT_ADDRESS])
    return branch if branch
    MerchantBranch.new(address: row[COL_MERCHANT_ADDRESS], merchant: merchant)
  end

  def get_or_build_item
    item = Item.find_by(name: row[COL_ITEM_NAME])
    return item if item
    Item.new(name: row[COL_ITEM_NAME])
  end
end
