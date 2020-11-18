require 'rails_helper'

RSpec.feature "Visitors can add an item to their carts", type: :feature , js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario 'add product to the cart' do 
    visit root_path
    within all('.product')[0] do
      page.find('footer').click_button('Add')
    end
    within('#navbar') { expect(page).to have_text('My Cart (1)') }
    save_screenshot "test_3.png"
  end
end
