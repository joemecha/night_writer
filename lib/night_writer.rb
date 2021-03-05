class NightWriter

  def initialize
    @user_input = get_input
    @read_file_name = @user_input[1]
    @write_file_name = @user_input[2]
    @read_file_chars = 0
  end

  def compose
    read_message_file
    write_file
    message_to_user
  end

  def read_message_file
    read_file = File.readlines("#{@read_file_name}").each do |line|
      @read_file_chars += line.chomp.length
      puts line
    end
  end

  def write_file
    write_file = File.open("#{@write_file_name}", 'w')
    write_file.puts "NightWriter is still in progress"
    write_file.close
  end

  def get_input
    gets.chomp.split
  end

  def message_to_user
    p "Created '#{@write_file_name}' containing #{@read_file_chars} characters"
  end
end
