class FileExtractorController < ApplicationController
  include FileHelper

  ADD_CHILD_ACTION = 'ADD_CHILD'.freeze
  GET_RELATIONSHIP_ACTION = 'GET_RELATIONSHIP'.freeze
  def extract
    path = params['path']
    contents = retrieve_content(path)
    result = []
    contents.each do |row|
      splitted = row.split
      action = splitted[0]
      if action == ADD_CHILD_ACTION
        mother_name = splitted[1]
        name = splitted[2]
        gender = splitted[3]
        result << add_children(mother_name, name, gender)
      elsif action == GET_RELATIONSHIP_ACTION
        name = splitted[1]
        relationship = splitted[2]
        result << get_relation(name, relationship)
      end
    end
    render json: { data:result}, status: :ok
  end

  private

  # process each action

  def add_children(mother_name, name, gender)
    gender = if gender.downcase == 'male'
               :male
             elsif gender.downcase == 'female'
               :female
             end
    child = Person.new(mother_name: mother_name, name: name, gender: gender )
    unless child.valid?
      return 'CHILD_ADDITION_FAILED' if child.errors.first.type == :taken
      return  child.errors.first.type
    end

    child.save
    'CHILD_ADDED'
  end

  def get_relation(name, relationship_type)
    person = Person.find_by(name: name)
    unless person.present?
      return 'PERSON_NOT_FOUND'
    end

    relationship_type = relationship_type.gsub('-','_')
    relationship_type.downcase!

    data = person.try("get_#{relationship_type}_name")
    return 'NONE' if data.nil?

    data
  end
end