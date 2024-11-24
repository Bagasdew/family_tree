module FileHelper

  def retrieve_content(path)
    file = File.join(Rails.root, path)
    content = File.readlines(file)

    # remove newline and left column ascii syntax
    content.each do |row|
      row.remove!("\r")
      row.remove!("\n")
    end

    content
  end
end