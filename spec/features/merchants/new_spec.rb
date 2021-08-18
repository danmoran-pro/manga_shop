require 'rails_helper'

RSpec.describe 'merchant index page' type: :feature do
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

      click_link 'Add Merchant'

      expect(current_path).to eq('/merchants/new')

      expect(page).to have_content('name')
      expect(page).to have_content('address')
      expect(page).to have_content('city')
      expect(page).to have_content('state')
      expect(page).to have_content('zip')
      expect(page).to have_content('name')
      
      expect(page).to have_button('submit')
    end
  end
end 



# As a visitor
# When I visit the Merchant Index page
# Then I see a link to create a new merchant
# When I click this link
# Then I am taken to '/merchants/new' where I see a form for a new merchant
# When I fill out the form with a new merchant's:

# name
# address
# city
# state
# zip
# And I click the button to submit the form
# Then a POST request is sent to '/merchants',
# a new merchant is created,
# and I am redirected to the Merchant Index page where I see the new Merchant listed.