class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.integer :capacity
      t.integer :cost
      t.integer :category

      t.timestamps null: false
    end
  end
end
