module Composable
  def read_message_file(file_name)
    contents = File.readlines(file_name).map do |line|
      line.downcase
          .chomp
    end
    contents
  end

  def write_file(file_name, new_contents)
    # if new_contents.length > 80
    #   new_contents.insert(80, "\n") # && new_contents.count("abcdefghijklmnopqrstuvwxyz").zero?
    # end
    write_file = File.open(file_name, 'w')
    write_file.puts new_contents
    write_file.close
  end

  def message_to_user
    p "Created '#{@write_file_name}' containing #{@read_file_chars} characters"
  end
end
