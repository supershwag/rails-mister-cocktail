# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require "open-uri"
require "json"
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

cocktail_1 = Cocktail.create(name: "Moscow Mule")
dose_1 = Dose.create(description: "blabla", cocktail: cocktail_1, ingredient: Ingredient.first)
