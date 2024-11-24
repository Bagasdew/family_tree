class FamilyLine < ApplicationRecord
  belongs_to :person
  belongs_to :ancestor, class_name: 'Person'

  enum relationship_type: {
    spouse:0,
    father: 1,
    mother: 2,
    paternal_uncle:3,
    maternal_uncle: 4,
    paternal_aunt: 5,
    maternal_aunt: 6,
    brother_in_law: 7,
    sister_in_law: 8,
    sibling: 9
  }





end
