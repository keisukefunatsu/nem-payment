class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.decimal :price_xem, precision: 10, scale: 2, default: 0
      t.decimal :price_yen, precision: 10, scale: 2, default: 0
      t.references :shop, foreign_key: true
      t.string :xem_message, null: false, default: ""
      t.text :memo
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
