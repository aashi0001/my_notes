class AddUserToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :user, foreign_key: true, index: true
  end
end
