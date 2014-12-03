class CreatePtoExpenses < ActiveRecord::Migration
  def change
    create_table :pto_expenses do |t|
      t.references :person, index: true
      t.decimal :hours
      t.date :expense_date
      t.timestamps
    end
  end
end
