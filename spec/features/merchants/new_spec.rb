require 'rails_helper'

RSpec.describe 'merchant index page', type: :feature do
  describe 'As a user' do
    before :each do
      @merchant_1 = create(:random_merchant)
      @merchant_2 = create(:random_merchant)
      @merchant_3 = create(:random_merchant)
      
      
    end
    
    it 'I can see a link to create a new merchant' do
      visit '/merchants'
      
      expect(page).to have_link(@merchant_1.name)
      expect(page).to have_link('Add Merchant')
    end 
    
    it 'I can see a form to create a new merchant' do
      visit '/merchants'

      click_link 'Add Merchant'

      name = 'Animaniacs'
      address = '123 Leaf Dr.'
      city = 'Denver'
      state = 'CO'
      zip = '80204'

      fill_in :name, with: name
      fill_in :address, with: address
      fill_in :city, with: city
      fill_in :state, with: state
      fill_in :zip, with: zip

      click_button "Create Merchant"

      new_merchant = Merchant.last

      expect(current_path).to eq('/merchants')
      expect(page).to have_content(name)
      expect(new_merchant.name).to eq(name)
      expect(new_merchant.address).to eq(address)
      expect(new_merchant.city).to eq(city)
      expect(new_merchant.state).to eq(state)
      expect(new_merchant.zip).to eq(zip)
    end

    it 'I cant create a merchant if all fields are not filled in' do
      visit '/merchants/new'

      name = 'Animaniacs'
      address = ''
      city = "Denver"
      state = ''
      zip = 80204

      fill_in :name, with: name
      fill_in :address, with: address
      fill_in :city, with: city
      fill_in :state, with: state
      fill_in :zip, with: zip

      click_button "Create Merchant"

      expect(page).to have_content("Address can't be blank and State can't be blank")
      expect(page).to have_button("Create Merchant")
    end

  end
end 