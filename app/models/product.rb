class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :rents

  def rents_new
    rents.new
  end
end
