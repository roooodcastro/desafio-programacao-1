require 'csv'

class PurchasesServices
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read
    CSV.read(filename, col_sep: "\t").each_with_index.map do |row, index|
      Purchase.create_from_csv!(row) unless index == 0
    end
  end
end
