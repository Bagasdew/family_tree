class CreateFamilyLines < ActiveRecord::Migration[7.1]
  def change
     create_table :family_lines do |t|
      t.references :person, index: true, foreign_key: {to_table: :persons}
      t.references :ancestor, index:true, foreign_key: {to_table: :persons}
      t.integer :relationship_type

      t.timestamps
    end
  end
end
  