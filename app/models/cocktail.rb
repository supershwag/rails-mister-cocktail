class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy # has many est toujours au pluriel
  has_many :ingredients, through: :doses # a partir d un cocktail retrouver tous les ingredients a travers ces doses cle : through et valeur c est doses

  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader

end
