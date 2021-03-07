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
    array_of_chars = @message.content
                             .gsub(/[^a-z]/i, "$")
                             .chars
    array_of_braille = create_array_of_braille(array_of_chars)
    string_of_braille = convert_braille_array_to_string(array_of_braille)
    @braille_message.add_content(string_of_braille)
    return string_of_braille
  end

  def translate_to_english
  end

  def create_array_of_braille(array)
    array.map do |character|
      @dictionary.english_braille[character]
    end
  end

  def convert_braille_array_to_string(array)
    braille_string = ""
    braille_string_1 = ""

    # Turn into a helper method
    if array.length <= 40
      array.each do |character|
        braille_string += character[0].join
      end
      braille_string += "\n"
      array.each do |character|
        braille_string += character[1].join
      end
      braille_string += "\n"
      array.each do |character|
        braille_string += character[2].join
      end
      braille_string

    else while array.length > 40 do
        array_1 = array[0..39]
        array = array[40..(array.length)]
        # Make helper method see above
        array_1.each do |character|
          braille_string_1 += character[0].join
        end
        braille_string_1 += "\n"
        array_1.each do |character|
          braille_string_1 += character[1].join
        end
        braille_string_1 += "\n"
        array_1.each do |character|
          braille_string_1 += character[2].join
        end
        braille_string_1 += "\n\n"
      end

      array.each do |character|
        braille_string += character[0].join
      end
      braille_string += "\n"
      array.each do |character|
        braille_string += character[1].join
      end
      braille_string += "\n"
      array.each do |character|
        braille_string += character[2].join
      end
      braille_string = braille_string_1 + braille_string
    end
  end
end

  # def char_to_braille(char)
  #   if english_braille.has_key?(char)
  #     return english_braille[char]
  #   elsif numbers_braille.has_key?(char)
  #     return numbers_braille["#"], numbers_braille[char]
  #   else
  #     return [["X", "X"], ["X", "X"], ["X", "X"]]
  #   end
  # end
