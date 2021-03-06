class CreateItem < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :items, :name, unique: true
  end
end
