class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
    @count_products = Product.count
    @category_count = Product.count('DISTINCT category_id')
  end 
end
