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
    contents = read_message_file(@read_file_name).join
    message.add_content(contents)
    @read_file_chars = message.character_count

    translator = Translator.new(message)
    new_contents = translator.translate
    write_file(@write_file_name, new_contents)

    message_to_user
  end
end

# ============================================================================
night_writer = NightWriter.new
night_writer.compose
