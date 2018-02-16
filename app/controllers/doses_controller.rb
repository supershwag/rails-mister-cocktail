class DosesController < ApplicationController

  def create
    # aller chercher le cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    # creer la dose avec l ingredient et la description
    @dose = Dose.new(dose_params)
    # association entre la dose et le cocktail / on a besoin du cocktail pour creer notre dose  (et un ingredient)
    @dose.cocktail = @cocktail
    if @dose.save
    redirect_to cocktail_path(@cocktail)
    else
    render "cocktails/show" # aller voir dans le dossier show
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params # permet de whitelister certains parametres
    params.require(:dose).permit(:description, :ingredient_id)
  end

end


# faire une variable d instance pour les vues
