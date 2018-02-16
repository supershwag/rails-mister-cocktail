Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails do
      resources :doses, only: [ :create ] # on nest car qd on cree une dose on prefere avoir id du cocktail dans url pour retrouver le cocktail et l associer ensuite dans le controller
      # pas besoin de new car on va creer dans la show de cocktail
  end
      resources :doses, only: :destroy
      # doit etre en dehors car on n'a pas besoin de l id du cocktail pour le detruire / A REVOIR
end
