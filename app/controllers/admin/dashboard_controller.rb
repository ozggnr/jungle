class Admin::DashboardController < ApplicationController
  def show
    @count_products = Product.count
    @category_count = Product.count('DISTINCT category_id')
  end 
end
