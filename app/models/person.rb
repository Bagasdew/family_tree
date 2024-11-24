class Person < ApplicationRecord
  self.table_name = 'persons'
  attr_accessor :mother_name
  has_many :family_lines
  enum gender: {male: 0, female: 1}

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  validate :validate_mother

  after_commit :create_family_lines


  def validate_mother
    mother = Person.find_by(name: mother_name)
    return errors.add(:base, 'PERSON_NOT_FOUND') if mother.nil?
    errors.add(:base, 'CHILD_ADDITION_FAILED') if mother.male?
  end

  # creating relation between families after creating the person
  def create_family_lines
    mother = Person.find_by(name: mother_name)
    return if mother.nil?
    ActiveRecord::Base.transaction do
      # Create Mother and Father
      family_data = []
      family_data << FamilyLine.new(person_id: self.id, ancestor_id: mother.id, relationship_type: :mother)
      errors.add(:base, 'CHILD_ADDITION_FAILED') if mother.spouse.nil?
      family_data << FamilyLine.new(person_id: self.id, ancestor_id: mother.spouse.id, relationship_type: :father)

      FamilyLine.import!(family_data)
    end
  end

  def mother
    FamilyLine.where(person_id: self.id, relationship_type: :mother).first&.ancestor
  end

  def father
    FamilyLine.where(person_id: self.id, relationship_type: :father).first&.ancestor
  end

  def spouse
    if self.female?
      FamilyLine.where(person_id: self.id, relationship_type: :spouse).first&.ancestor
    elsif self.male?
      FamilyLine.where(ancestor_id: self.id, relationship_type: :spouse).first&.person
    end
  end

  def siblings
    FamilyLine.where(ancestor_id: mother&.id, relationship_type: :mother).where.not(person_id: self.id)
  end

  # below code contains a bit of N+1,
  # I opted for this approach considering the data is small enough and will not overcomplicate rows in databases
  def get_mother_name
    mother.name
  end

  def get_father_name
    father.name
  end

  def get_spouse_name
    spouse.name if spouse.present?
  end

  def get_siblings_name
    siblings.map {|sib| sib.person.name}
  end

  def get_paternal_aunt_name
    father.siblings.filter_map {|sib| sib.person.name if sib.person.female?}
  end

  def get_maternal_aunt_name
    mother.siblings.filter_map {|sib| sib.person.name if sib.person.female?}
  end

  def get_paternal_uncle_name
    father.siblings.filter_map {|sib| sib.person.name if sib.person.male?}
  end

  def get_maternal_uncle_name
    mother.siblings.filter_map {|sib| sib.person.name if sib.person.male?}
  end

  def get_brother_in_laws_name
    from_sibling = siblings.filter_map {|sib| sib.person.spouse.name if sib.person.spouse.present? && sib.person.spouse.male?}
    from_spouse = spouse.siblings.filter_map {|sib| sib.person.name if sib.person.male?} if spouse.present?
    from_sibling.concat(from_spouse)
  end

  def get_sister_in_laws_name
    from_sibling = siblings.filter_map {|sib| sib.person.spouse.name if sib.person.spouse.present? && sib.person.spouse.female?}
    from_spouse = spouse.siblings.filter_map {|sib| sib.person.name if sib.person.female?} if spouse.present?
    from_sibling.concat(from_spouse)
  end
end

