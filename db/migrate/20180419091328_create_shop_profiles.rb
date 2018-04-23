class CreateShopProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_profiles do |t|
      t.string :name, default: ""
      t.string :xem_address, default: ""
      t.string :xem_address2, default: ""
      t.string :xem_address3, default: ""
      t.string :tel_number, default: ""
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
