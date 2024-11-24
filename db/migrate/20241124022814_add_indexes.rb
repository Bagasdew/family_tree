class AddIndexes < ActiveRecord::Migration[7.1]
  def change
    add_index :persons, :name, unique: true
    add_index :family_lines, [:person_id,:ancestor_id,:relationship_type]
    add_index :family_lines, [:ancestor_id, :person_id,:relationship_type]
  end
end
