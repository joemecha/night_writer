module Composable
  def read(file_name)
    contents = File.readlines(file_name).map do |line|
      line.chomp
    end
    contents
  end

  def write(file_name, new_contents)
    write_file = File.open(file_name, 'w')
    write_file.puts new_contents
    write_file.close
  end

  def display_message
    if @read_file_chars == 1
      p "Created '#{@write_file_name}' containing "\
      "#{@read_file_chars} character"
    else
      p "Created '#{@write_file_name}' containing "\
      "#{@read_file_chars} characters"
    end
  end
end
