class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :naem
      t.string :image
      t.string :address
      t.string :city
      t.string :state
      t.string :start_date
      t.string :end_date
      t.string :start_time
      t.string :end_time

      t.timestamps null: false
    end
  end
end
