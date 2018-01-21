namespace :example do
  desc 'Creates an example file with random but valid data'
  task :create, [:rows, :filename] => [:environment] do |_, args|
    header = ['purchaser name', 'item description', 'item price',
              'purchase count', 'merchant address', 'merchant name']
    num_rows = (args[:rows] || (Random.rand(20) + 1)).to_i
    lines = num_rows.times.map do
      [
        Faker::Pokemon.name,
        Faker::Commerce.product_name,
        Faker::Commerce.price,
        Random.rand(9) + 1,
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
