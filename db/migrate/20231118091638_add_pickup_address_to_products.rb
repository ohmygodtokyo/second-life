class AddPickupAddressToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :pickup_address, :string, null: false, default: ""
  end
end
