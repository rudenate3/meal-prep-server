class QuantitiesController < OpenReadController
  before_action :set_quantity, only: [:show, :update, :destroy]

  # GET /quantities
  def index
    @quantities = Quantity.all

    render json: @quantities
  end

  # GET /quantities/1
  def show
    render json: @quantity
  end

  # POST /quantities
  def create
    if !current_user.admin
      render status: :unauthorized
    else
      @quantity = Quantity.new(quantity_params)

      if @quantity.save
        render json: @quantity, status: :created, location: @quantity
      else
        render json: @quantity.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /quantities/1
  def update
    if !current_user.admin
      render status: :unauthorized
    elsif @quantity.update(quantity_params)
      render json: @quantity
    else
      render json: @quantity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quantities/1
  def destroy
    if !current_user.admin
      render status: :unauthorized
    else
      @quantity.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quantity
      @quantity = Quantity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quantity_params
      params.require(:quantity).permit(:title, :description)
    end
end
