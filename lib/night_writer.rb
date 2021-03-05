class NightWriter
  # attr_reader :user_input

  def initialize
    @user_input = gets.chomp.split
    @read_file_name = @user_input[1]
    @write_file_name = @user_input[2]
    @read_file_characters = 0
  end

  def compose
    # refactor into various methods, classes, etc
    read_file = File.readlines("#{@read_file_name}").each do |line|
      @read_file_characters += line.chomp.length
      puts line
    end


    write_file = File.open("#{@write_file_name}", 'w')
    write_file.puts "NightWriter is still in progress"
    write_file.close

    p "Created '#{@write_file_name}' containing #{@read_file_characters} characters"
  end

end
