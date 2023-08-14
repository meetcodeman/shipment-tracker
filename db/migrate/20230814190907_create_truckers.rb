class CreateTruckers < ActiveRecord::Migration[6.1]
  def change
    create_table :truckers, id: :uuid do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
