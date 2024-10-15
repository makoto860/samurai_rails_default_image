class Rent < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def save_rent(rent, rent_params)
    rent.start_date = rent_params[:start_date]
    rent.end_date = rent_params[:end_date]
    rent.user_id = rent_params[:user_id]
    rent.product_id = rent_params[:product_id]
    save
  end
end
