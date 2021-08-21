require 'rails_helper'

RSpec.describe 'merchant index page', type: :feature do
  describe 'As a user' do
    before :each do
      @merchant_1 = Merchant.create(name: 'Animaniacs', address: '123 Leaf Rd.', city: 'Denver', state: 'CO', zip: '80204')
    end

    it 'Prepopulated mechant data appears in edit form' do
      visit "/merchants/#{@merchant_1.id}"

      click_link 'Update Merchant'

      
      expect(page).to have_link(@merchant_1.name)
      expect(find_field('Name').value).to eq "Animaniacs"
      expect(find_field('Address').value).to eq '123 Leaf Rd.'
      expect(find_field('City').value).to eq 'Denver'
      expect(find_field('State').value).to eq 'CO'
      expect(find_field('Zip').value).to eq "80204"
    end 
    
    it 'can update merchant info' do
      visit "/merchants/#{@merchant_1.id}"
      
      click_link 'Update Merchant'
      
      fill_in 'Name', with: "Toyko Reads"
      fill_in 'Address', with: "321 Sand Rd."
      fill_in 'City', with: "Denver"
      fill_in 'State', with: "CO"
      fill_in 'Zip', with: '80219'
      
      click_button "Update Merchant"
      # save_and_open_page
      expect(current_path).to eq("/merchants/#{@merchant_1.id}")

      expect(page).to_not have_content("Animaniacs")
      expect(page).to_not have_content("123 Leaf Rd.,\nDenver, CO 80204")

    

      expect(page).to have_content("Toyko Reads")
      expect(page).to have_content("321 Sand Rd.")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("80219")
    end 
    
    it 'I cant update a merchant if all fields are not filled in' do
      visit "/merchants/#{@merchant_1.id}"
      click_link 'Update Merchant'
      
      fill_in 'Name', with: " "
      fill_in 'Address', with: "321 Sand Rd."
      fill_in 'City', with: " "
      fill_in 'State', with: "CO"
      fill_in 'Zip', with: '80219'

      click_button "Update Merchant"

      expect(page).to have_content("Name can't be blank and City can't be blank")
      expect(page).to have_button("Update Merchant")
    end
  end 
end 