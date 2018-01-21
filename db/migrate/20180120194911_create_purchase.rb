class CreatePurchase < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :item_count
      t.float :item_price
      t.references :purchaser, foreign_key: true
      t.references :merchant_branch, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end
