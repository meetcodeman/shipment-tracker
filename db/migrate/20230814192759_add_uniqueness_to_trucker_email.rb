class AddUniquenessToTruckerEmail < ActiveRecord::Migration[6.1]
  def change
    change_column :truckers, :email, :string, null: false, unique: true
  end
end
