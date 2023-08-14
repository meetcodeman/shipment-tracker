class CreateShipments < ActiveRecord::Migration[6.1]
  def change
    create_table :shipments, id: :uuid do |t|
      t.decimal :lat, null: false
      t.decimal :long, null: false
      t.string :product, null: false
      t.string :description
      t.datetime :delivery_date, null: false
      t.string :status, null: false, default: 'PRE_TRANSIT'
      t.uuid :trucker_id

      t.timestamps
    end

    add_foreign_key :shipments, :truckers, column: :trucker_id, type: :uuid
  end
end
