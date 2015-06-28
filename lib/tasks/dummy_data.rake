namespace :dummy_data do
  desc "TODO"

  task add_dummy_products: :environment do
    puts "in add_dummy_products"

    dummy_products = [
        {"name"=> "Mixed Veg Wrap", "price"=> 150},
        {"name"=> "Chatpate Chole", "price"=> 149.5}
    ]

    puts "----- dummy_products -----"
    # puts dummy_products

    puts "each starting"
    dummy_products.each do  |dummy_product|
      product = Product.create(name: dummy_product['name'], price: dummy_product['price'])
      product.save
    end

    puts "----- dummy_products created -----"
  end

end
