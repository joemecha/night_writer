require './lib/composable'
require './lib/translator'
require './lib/dictionary'
require './lib/message'

class NightWriter
  include Composable

  attr_reader :translator

  def initialize
    @read_file_name = ARGV[0]
    @write_file_name = ARGV[1]
    @read_file_chars = 0
  end

  def compose
    message = Message.new
    contents = read(@read_file_name)
    message.add_content(contents)
    @read_file_chars = message.character_count

    translator = Translator.new(message)
    new_contents = translator.translate
    write(@write_file_name, new_contents)

    display_message
  end
end

# ==============================================================================
if ARGV.length != 2
  puts "Night Writer requires two arguments:"
  puts "ruby lib/night_writer.rb <message-filename>.txt <encoded-filename>.txt"
  puts "=" * 80
  exit
else
  night_writer = NightWriter.new
  night_writer.compose
end
