# seed for initial family tree
king = Person.new(mother_name: nil, name: 'King Arthur', gender: :male)
king.save(validate:false)
queen = Person.new(mother_name: nil, name: 'Queen Margret', gender: :female)
queen.save(validate:false)
relationship = FamilyLine.new(person_id: queen.id, ancestor_id: king.id, relationship_type: :spouse)
relationship.save

# create childs
bill = Person.create(mother_name: queen.name, name: 'Bill', gender: :male)
charlie = Person.create(mother_name: queen.name, name: 'Charlie', gender: :male)
percy = Person.create(mother_name: queen.name, name: 'Percy', gender: :male)
ronald = Person.create(mother_name: queen.name, name: 'Ronald', gender: :male)
ginerva = Person.create(mother_name: queen.name, name: 'Ginerva', gender: :female)

#create spouses for childs
flora = Person.new(mother_name: nil, name: 'Flora', gender: :female)
audrey = Person.new(mother_name: nil, name: 'Audrey', gender: :female)
helen = Person.new(mother_name: nil, name: 'Helen', gender: :female)
harry = Person.new(mother_name: nil, name: 'Harry', gender: :male)
flora.save(validate:false)
helen.save(validate:false)
audrey.save(validate:false)
harry.save(validate:false)
FamilyLine.create(person:flora, ancestor: bill, relationship_type: :spouse)
FamilyLine.create(person:audrey, ancestor: percy, relationship_type: :spouse)
FamilyLine.create(person:ginerva, ancestor: harry, relationship_type: :spouse)
FamilyLine.create(person:helen, ancestor: ronald, relationship_type: :spouse)

# create grandchildrens
victoire = Person.create(mother_name: flora.name, name: 'Victoire', gender: :female)
dominique = Person.create(mother_name: flora.name, name: 'Dominique', gender: :female)
louis = Person.create(mother_name: flora.name, name: 'Louis', gender: :male)

molly = Person.create(mother_name: audrey.name, name: 'Molly', gender: :female)
lucy = Person.create(mother_name: audrey.name, name: 'Lucy', gender: :female)

rose = Person.create(mother_name: helen.name, name: 'Rose', gender: :female)
hugo = Person.create(mother_name: helen.name, name: 'Hugo', gender: :male)

james = Person.create(mother_name: ginerva.name, name: 'James', gender: :male)
albus = Person.create(mother_name: ginerva.name, name: 'Albus', gender: :male)
lily = Person.create(mother_name: ginerva.name, name: 'Lily', gender: :female)


ted = Person.new(mother_name: nil, name: 'Ted', gender: :male)
ted.save(validate:false)
FamilyLine.create(person: victoire, ancestor: ted, relationship_type: :spouse)
Person.create(mother_name: victoire.name, name: 'Remus', gender: :male)



malfoy = Person.new(mother_name: nil, name: 'Malfoy', gender: :male)
malfoy.save(validate:false)
FamilyLine.create(person: rose, ancestor: malfoy, relationship_type: :spouse)
Person.create(mother_name: rose.name, name: 'Drace', gender: :male)
Person.create(mother_name: rose.name, name: 'Aster', gender: :female)


alice = Person.new(mother_name: nil, name: 'Alice', gender: :female)
alice.save(validate:false)
FamilyLine.create(person: alice, ancestor: albus, relationship_type: :spouse)
Person.create(mother_name: alice.name, name: 'Ron', gender: :male)
Person.create(mother_name: alice.name, name: 'Ginny', gender: :female)

darcy = Person.new(mother_name: nil, name: 'Darcy', gender: :female)
darcy.save(validate:false)
FamilyLine.create(person: darcy, ancestor: james, relationship_type: :spouse)
Person.create(mother_name: darcy.name, name: 'William', gender: :female)