class Translator
    attr_reader :message,
                :braille_message,
                :english_message

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
  end

  def translate
    if not @message.is_braille?
      translate_to_braille
      @braille_message.content
    else
      # translate_to_english
    end
  end

  def translate_to_braille
    @braille_message = Message.new
    array_of_chars = @message.content.chars
    array_of_braille = array_of_chars.map do |character|
      @dictionary.english_braille[character]
    end
    # linewidth = 80 # Use #ljust(linewidth) to limit width
    string_of_braille = ""
    array_of_braille.each do |character|
      string_of_braille += character[0].join
    end
    string_of_braille += "\n"
    array_of_braille.each do |character|
      string_of_braille += character[1].join
    end
    string_of_braille += "\n"
    array_of_braille.each do |character|
      string_of_braille += character[2].join
    end
    @braille_message.add_content(string_of_braille)
    return string_of_braille
  end

  def translate_to_english
  end
end
