class CreateMerchantBranch < ActiveRecord::Migration[5.1]
  def change
    create_table :merchant_branches do |t|
      t.string :address
      t.references :merchant, foreign_key: true
      t.timestamps
    end
  end
end
