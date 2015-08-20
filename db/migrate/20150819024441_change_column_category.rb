class ChangeColumnCategory < ActiveRecord::Migration
  def change
    change_column :events,  :category, :integer 
  end
end
