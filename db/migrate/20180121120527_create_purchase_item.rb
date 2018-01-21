class CreatePurchaseItem < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_items do |t|
      t.integer :item_count
      t.float :item_price
      t.references :purchaser, foreign_key: true
      t.references :purchase, foreign_key: true
      t.references :merchant_branch, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
