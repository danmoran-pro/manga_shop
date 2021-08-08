require 'rails_helper'

RSpec.describe 'merchants index page', type: :feature do
  describe 'As a user' do
    before :each do
      @merchant_1 = create(:random_merchant)
      @merchant_2 = create(:random_merchant)
      @merchant_3 = create(:random_merchant)
    end

    it 'I can STILL see a list of merchants in the system' do
      visit '/merchants'

      expect(page).to have_link(@merchant_1.name)
      expect(page).to have_link(@merchant_2.name)
      expect(page).to have_link(@merchant_3.name)
    end

    it 'I can STILL see a list of merchants in the system' do
      visit "/merchants/#{@merchant_1.id}"

      expect(page).to have_link(@merchant_1.name)
      expect(page).to have_link(@merchant_1.address)
      expect(page).to have_link(@merchant_1.city)
      expect(page).to have_link(@merchant_1.state)
      expect(page).to have_link(@merchant_1.zip)
    end
  end 
end 