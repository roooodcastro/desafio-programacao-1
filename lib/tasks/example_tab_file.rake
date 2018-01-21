namespace :example do
  desc 'Creates an example file with random but valid data'
  task :create do
    header = ['purchaser name', 'item description', 'item price',
              'purchase count', 'merchant address', 'merchant name']
    lines = (Random.rand(20) + 1).times.map do
      [
        Faker::Pokemon.name,
        Faker::Commerce.product_name,
        Faker::Commerce.price,
        Random.rand(9) + 1,
        Faker::Company.name,
        Faker::Address.street_address
      ]
    end
    lines = lines.unshift(header)
    File.open("example_#{Time.now.to_i}.tab", 'w') do |f|
      lines.each do |line|
        f.puts line.join("\t")
      end
    end
  end
end
