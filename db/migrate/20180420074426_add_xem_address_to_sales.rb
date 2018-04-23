class AddXemAddressToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :xem_address, :string, default: ""
  end
end
