class CreatePurchase < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.float :price_sum
      t.timestamps
    end
  end
end
