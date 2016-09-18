class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|
      t.integer :leave_type, null: false, default: 0
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false

      t.timestamps
    end
  end
end
