class CreatePersons < ActiveRecord::Migration[7.1]
  def change
    create_table :persons do |t|
      t.string :name
      t.integer :gender

      t.timestamps
    end
  end
end