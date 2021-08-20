require 'rails_helper'

RSpec.describe 'merchant index page', type: :feature do
  describe 'As a user' do
    before :each do
      @merchant_1 = create(name: 'Animaniacs', address: '123 Leaf Dr.', city: 'Denver', state: 'CO', zip: '80204')
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

    it 'Prepopulated mechant data appears in edit form' do
      visit "/merchants/#{@merchant_1.id}"

      click_link 'Update Merchant'

      fill_in 'Name', with: "Toyko Reads"
      fill_in 'Address', with: "321 Sand Rd."
      fill_in 'City', with: "Denver"
      fill_in 'State', with: "CO"
      fill_in 'Zip', with: '80219'

      click_link "Update Merchant"
      
      expect(current_path).to eq("/merchants/#{@merchant_1.id}")
      expect(page).to_not have_content("Animaniacs")
      expect(page).to_not have_content("123 Leaf Rd.\nDenver, CO 80204")

      expect(page).to have_content("Toyko Reads")
      expect(page).to have_content("321 Sand Rd.\nDenver, CO 80210")

    end 
  end 
end 

# As a visitor
# When I visit a merchant show page
# Then I see a link to update the merchant
# When I click the link
# Then I am taken to '/merchants/:id/edit' where I see a form to edit the merchant's data including:

# name
# address
# city
# state
# zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a PATCH request is sent to '/merchants/:id',
# the merchant's info is updated,
# and I am redirected to the Merchant's Show page where I see the merchant's updated info