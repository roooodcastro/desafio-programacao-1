class AddAttachmentDataFileToPurchases < ActiveRecord::Migration[5.1]
  def self.up
    change_table :purchases do |t|
      t.attachment :data_file
    end
  end

  def self.down
    remove_attachment :purchases, :data_file
  end
end
