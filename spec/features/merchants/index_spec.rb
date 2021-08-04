require 'rails_helper'

RSpec.describe 'merchants index page', type: :feature do
  describe 'As a user' do
    before :each do
      @merchant_1 = create(:random_merchant)
      @merchant_2 = create(:random_merchant)
      @merchant_3 = create(:random_merchant)
    end

    it 'I can see a list of merchants in the system' do
      visit '/merchants'

      expect(page).to have_link(@merchant_1.name)
      expect(page).to have_link(@merchant_2.name)
      expect(page).to have_link(@merchant_3.name)
    end
  end 
end 