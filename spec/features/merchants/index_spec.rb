require 'rails_helper'

RSpec.describe 'merchants index page', type: :feature do
  describe 'As a user' do
    before :each do
      @bike_shop = Merchant.create(name: "Brian's Bike Shop")
      @dog_shop = Merchant.create(name: "Meg's Dog Shop")
    end

    it 'I can see a list of merchants in the system' do
      visit '/merchants'

      expect(page).to have_link("Brian's Bike Shop")
      expect(page).to have_link("Meg's Dog Shop")
    end
  end 
end 