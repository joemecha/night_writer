module Composable
  def read_message_file(file_name)
    contents = File.readlines(file_name).map do |line|
      line.chomp
    end
    contents
  end

  def write_file(file_name, new_contents)
    write_file = File.open(file_name, 'w')
    write_file.puts new_contents
    write_file.close
  end

  def message_to_user
    if @read_file_chars == 1
      p "Created '#{@write_file_name}' containing "\
      "#{@read_file_chars} character"
    else
      p "Created '#{@write_file_name}' containing "\
      "#{@read_file_chars} characters"
    end
  end
end
