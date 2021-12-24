class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :item
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
