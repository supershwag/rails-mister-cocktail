# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require "open-uri"
require "json"
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

# ingredient.each do |ingredient|
ingredient["drinks"].each do |ingredient_hash|
  ingredient = ingredient_hash["strIngredient1"]
  new_ingredient = Ingredient.new(name: ingredient)
  new_ingredient.save
end



url = "http://res.cloudinary.com/thanhan/image/upload/v1518797897/2015-04-28-PHOTO-00000195.jpg"
cocktail = Cocktail.new(name: "Vodka Mate")
cocktail.remote_photo_url = url
cocktail.save

url_1 = "http://res.cloudinary.com/thanhan/image/upload/v1518797816/DSC00764.jpg"
cocktail_1 = Cocktail.new(name: "Celine Dion")
cocktail_1.remote_photo_url = url_1
cocktail_1.save

url_2 = "http://res.cloudinary.com/thanhan/image/upload/v1518797801/DSC00232.jpg"
cocktail_2 = Cocktail.new(name: "London Mule")
cocktail_2.remote_photo_url = url_2
cocktail_2.save
