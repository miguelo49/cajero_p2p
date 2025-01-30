class CreateExchanges < ActiveRecord::Migration[8.0]
  def change
    create_table :exchanges do |t|
      t.decimal :amount
      t.string :exchange_type
      t.string :status
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
