class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.string :name, null: false
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
