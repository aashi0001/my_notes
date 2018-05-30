class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title, default: "untitled"
      t.string :etags, array: true, default: []
      t.text :content
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
