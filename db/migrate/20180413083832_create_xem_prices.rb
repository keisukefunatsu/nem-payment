class CreateXemPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :xem_prices do |t|
      t.decimal :price_zaif, precision: 10, scale: 4
      t.decimal :price_cap, precision: 10, scale: 4

      t.timestamps
    end
  end
end
