class FavoritesController < ProtectedController
  
  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id

    if @favorite.save
      render json: @favorite, status: :created
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def destroy
    authorized = (current_user.id == @favorite.user_id || current_user.admin)
    if !authorized
      render status: :unauthorized
    else
      @favorite.destroy
    end
  end

  def favorite_params
    params.require(:favorite).permit(:recipe_id)
  end
end
