class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.decimal :exchange

      t.timestamps null: false
    end
  end
end
