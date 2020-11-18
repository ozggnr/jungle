require 'rails_helper'

RSpec.feature "Visitor can see the product details", type: :feature, js: true do
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

    scenario 'goes to the product page' do 
      visit root_path
      within all('.product')[0] do
      page.find('.actions').find_link('Details').click
      end
      expect(page).to have_text('Description')
      save_screenshot 'test_2.png'
    end
end
