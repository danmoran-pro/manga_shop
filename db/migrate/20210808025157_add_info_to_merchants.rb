class AddInfoToMerchants < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :address, :string
    add_column :merchants, :city, :string
    add_column :merchants, :state, :string
    add_column :merchants, :zip, :string
  end
end
