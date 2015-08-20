class AddConferenceReferenceToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :conference, index: true, foreign_key: true

  end
end
