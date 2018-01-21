# frozen_string_literal: true

namespace :example do
  desc 'Creates an example file with random but valid data'
  task :create, [:rows, :filename] => [:environment] do |_, args|
    header = ['purchaser name', 'item description', 'item price',
              'purchase count', 'merchant address', 'merchant name']
    num_rows = (args[:rows] || Random.rand(1..20)).to_i
    lines = Array.new(num_rows).map do
      [
        Faker::Pokemon.name,
        Faker::Commerce.product_name,
        Faker::Commerce.price,
        Random.rand(1..9),
        Faker::Address.street_address,
        Faker::Company.name
      ]
    end
    lines = lines.unshift(header)
    filename = args[:filename] || "example_#{Time.now.to_i}.tab"
    File.open(filename, 'w') do |f|
      lines.each { |line| f.puts line.join("\t") }
    end
  end
end
