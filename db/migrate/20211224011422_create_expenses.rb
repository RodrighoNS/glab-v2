class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :item
      t.decimal :amount
      t.string :payment_status

      t.timestamps
    end
  end
end
