# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:username => "Admin", :email => "admin@example.com", :password => "password",
  :password_confirmation => "password", :role => "admin")

User.create(:username => "Owner1", :email => "owner1@example.com", :password => "password",
  :password_confirmation => "password", :role => "owner")

User.create(:username => "Owner2", :email => "owner2@example.com", :password => "password",
  :password_confirmation => "password", :role => "owner")

Restaurant.create(:name => "Metropolitan Grill", :address => "820 2nd Ave, Seattle, WA 98104",
  :category => "American", :phone_number => "206-555-4646", :website => "www.metropolitangrill.com",
  :owner => 2)

Restaurant.create(:name => "The Triple Door", :address => "216 Union St, Seattle, WA 98101",
  :category => "Thai", :phone_number => "206-555-6464", :website => "www.thetripledoor.com",
  :owner => 3)

Item.create(:dish_name => "Steak", description: "Tough, but edible", :inventory => 100, :restaurant_id => 1, :subcategory => "Entres", :dollars => 9, :cents => 99, :item_id => 1)

Item.create(:dish_name => "Fish and Chips", description: "Succulent as hell", :inventory => 50, :restaurant_id => 1, :subcategory => "Entres", :dollars => 15, :cents => 49, :item_id => 2)

Item.create(:dish_name => "Halibut", description: "It's an ugly fish", :inventory => 30, :restaurant_id => 1, :subcategory => "Entres", :dollars => 49, :cents => 49, :item_id => 3)

Item.create(:dish_name => "Sam Jackson", description: "Shit'll get you drunk!", :inventory => 100, :restaurant_id => 1, :subcategory => "Beer", :dollars => 3, :cents => 50, :item_id => 6)

Item.create(:dish_name => "Chicken Satays", description: "The old standby; too much peanut sauce", :inventory => 32, :restaurant_id => 2, :subcategory => "Entres", :dollars => 5, :cents => 49, :item_id => 4)

Item.create(:dish_name => "Pad Thai", description: "Super spicccy~~", :inventory => 20, :restaurant_id => 2, :subcategory => "Entres", :dollars => 43, :cents => 99, :item_id => 5)
