class CreateExchange < ActiveRecord::Migration[8.0]
  def change
    create_table :exchanges do |t|
      t.timestamps
    end
  end
end
