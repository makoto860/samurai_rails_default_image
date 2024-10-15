class RentsController < ApplicationController
  def index
    @rents = Rent.all
  end

  def create
    @rent = Rent.new(rent_params)

    if @rent.save
      redirect_to @rent, success: '予約が完了しました。'
    else
      @product = @rent.product
      render :confirmation, status: :unprocessable_entity
    end
  end

  def confirmation
    @product = Product.find(params[:rent][:product_id])
    @rent = @product.rents.new(rent_params)
  end

  def show
    @rent = Rent.find(params[:id])
  end

  private
  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :product_id, :user_id)
  end
end
