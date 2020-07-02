class CreateCruds < ActiveRecord::Migration[5.2]
  def change
    create_table :cruds do |t|
      t.references :user, foreign_key: true
      t.string :some_text
      t.integer :foo

      t.timestamps
    end
  end
end
