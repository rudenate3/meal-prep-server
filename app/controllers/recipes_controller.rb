class RecipesController < OpenReadController
  before_action :set_recipe, only: [:show, :update, :destroy]
 
  # TODO favorited should not be be editable, only incremented or decremented 

  # GET /recipes
  def index
    @recipes = Recipe.all

    render json: @recipes
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    authorized = (current_user.id == @recipe.user_id || current_user.admin)
    if !authorized 
      render status: :unauthorized
    elsif @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    authorized = (current_user.id == @recipe.user_id || current_user.admin)
    if !authorized 
      render status: :unauthorized
    else
      @recipe.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:title, :user_id, :description, :favorited)
    end
end
