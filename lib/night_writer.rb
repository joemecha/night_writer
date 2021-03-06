require './lib/dictionary'
require './lib/composable'

class NightWriter
  include Composable

  attr_reader :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
    @read_file_name = ARGV[0]
    @write_file_name = ARGV[1]
    @message = ""
    @read_file_chars = 0
  end

  def compose
    read_message_file(@read_file_name)
    write_file(@write_file_name)
    message_to_user
  end

  def translate_to_braille
    array_of_chars = @message.chars
    array_of_braille = array_of_chars.map do |char|
      english_braille[char]
    end
    array_of_braille
  end
end

# ============================================================================
@dictionary = Dictionary.new
night_writer = NightWriter.new(@dictionary)
night_writer.compose

night_writer.translate_to_braille
