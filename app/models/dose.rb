class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail # genere une methode dose.cocktail qui renvoie le cocktail associe a la dose

  # A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
  validates :description, presence: true
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id

  # pour creer une dose :
  # dose = dose.new
  # cocktail = Cocktail.first
  # ingredient = Ingredient.first
  # dose.ingredient = ingredient
  # dose.cocktail = cocktail
  # permet d associer toutes nos tables

end
