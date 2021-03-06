class Translator
    attr_reader :message

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
  end

  def translate_to_braille
    array_of_chars = @message.content.chars
    array_of_braille = array_of_chars.map do |char|
      @dictionary.english_braille[char]
    end
    array_of_braille 
  end

  def translate_to_english
  end
end
