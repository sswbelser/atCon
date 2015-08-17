class ChangeSpellingToName < ActiveRecord::Migration
  def change
  	rename_column :conferences, :naem, :name
  end
end
