class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :etags
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
