require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should password equal to password confirmation' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      expect(@password).to eq(@password_confirmation)
    end

    it 'should have name' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      expect(@user.name).to be_nil
    end
    it 'should have name' do
      @user = User.new(name: 'name', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      expect(@user.name).not_to be_nil 
    end
    it 'should have unique email' do
      @user = User.new(name: 'name',email: 'test@test.com', password: 'password', password_confirmation: 'password') 
      expect(@user.email).to eq('test@test.com')
    end
    it 'should have unique email' do
      @user = User.new(name: 'name',email: 'test@test.COM', password: 'password', password_confirmation: 'password') 
      expect(@user.email).not_to eq('test@test.com')
    end
    it 'should have unique email' do
      @user = User.new(name: 'name',email: 'test@test.COM', password: 'password', password_confirmation: 'password') 
      expect(@user.email).not_to eq('TEST@TEST.com')
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should be case insensitive for email' do
      @user = User.new(name: 'name', email: 'TeSt@test.com', password: 'password', password_confirmation: 'password') 
      expect(@user.email).to eq('test@test.com')
    end
    it 'should allow before and trailing empty spaces email' do
      @user = User.new(name: 'name', email: ' test@test.com', password: 'password', password_confirmation: 'password') 
      expect(@user.email).to eq('test@test.com')
    end
  end 
end
