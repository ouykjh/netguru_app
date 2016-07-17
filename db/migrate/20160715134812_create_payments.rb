class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.date :paid_date, null: false
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :students
  end
end