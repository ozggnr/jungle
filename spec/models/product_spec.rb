require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully' do
      @category = Category.new(name: 'sport')
      @product = Product.create(name: 'name', price: 20, quantity: 3, category: @category)
    end
    it 'should have name' do
      @category = Category.new(name: 'furniture')
      @product = Product.create(price: 20, quantity: 3, category: @category) 
      expect(@product.name).to be_nil
      # puts @product.errors.full_messages
    end
    it 'should have price' do
      @category = Category.new(name: 'furniture')
      @product = Product.create(name: 'name', price: 20, quantity: 3, category: @category) 
      expect(@product.price).not_to be_nil
    end
    it 'should have quantity' do
      @category = Category.new(name: 'furniture')
      @product = Product.create(name: 'name', price: 20, quantity: 3, category: @category) 
      expect(@product.quantity).not_to be_nil
    end
    it 'should have category' do
      @category = Category.new(name: 'furniture')
      @product = Product.create(name: 'name', price: 20, quantity: 3, category: @category) 
      expect(@product.category).not_to be_nil
    end
  end 
end
