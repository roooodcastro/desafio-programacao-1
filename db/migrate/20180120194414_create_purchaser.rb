class CreatePurchaser < ActiveRecord::Migration[5.1]
  def change
    create_table :purchasers do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :purchasers, :name, unique: true
  end
end
