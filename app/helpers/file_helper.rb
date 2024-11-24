module FileHelper

  def retrieve_content(path)
    file = File.join(Rails.root, path)
    content = File.readlines(file)
    content.each do |row|
      row.remove!("\r")
      row.remove!("\n")
      # splitted = row.split
      # action = splitted[0]
      # if action == ADD_CHILD_ACTION
      #   mother_name = splitted[1]
      #   name = splitted[2]
      #   gender = splitted[3]
      #   puts action
      # elsif action == GET_RELATIONSHIP_ACTION
      #   name = splitted[1]
      #   relationship = splitted[2]
      #   puts action
      # end
    end
    content
  end
end