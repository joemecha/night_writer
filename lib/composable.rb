module Composable
  def read_message_file(file_name)
    @message = File.readlines(file_name).each do |line|
      @read_file_chars += line.chomp.length
    end
    @message
  end

  def write_file(file_name)
    write_file = File.open(file_name, 'w')
    write_file.puts @message
    write_file.close
  end

  def message_to_user
    p "Created '#{@write_file_name}' containing #{@read_file_chars} characters"
  end
end
