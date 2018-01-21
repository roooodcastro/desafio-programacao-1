# frozen_string_literal: true

require 'csv'

class Purchase < ApplicationRecord
  has_many :purchase_items, dependent: :delete_all

  has_attached_file :data_file
  validates_attachment_content_type :data_file, content_type: ['text/plain']

  validates :data_file, attachment_presence: true

  def save_and_parse!
    ApplicationRecord.transaction_with_rollback do
      parse_csv_file!
      calculate_price_sum
      save!
    end
  end

  private

  def parse_csv_file!
    CSV.read(data_file_file_name, col_sep: "\t").each_with_index.map do |row, i|
      PurchaseBuilder.new(self, row).save! unless i.zero?
    end
  end

  def calculate_price_sum
    self.price_sum = purchase_items.map(&:total_price).sum
  end
end
