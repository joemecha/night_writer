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
      translate_to_english
      @english_message.content
    end
  end

  def translate_to_braille
    @braille_message = Message.new
    english_input_split = @message.content
                                  .downcase
                                  .gsub(/[^a-z .,'!?]/i, "$")
                                  .chars
    array_of_braille = create_array_of_braille(english_input_split)
    string_of_braille = convert_braille_array_to_string(array_of_braille)
    @braille_message.add_content(string_of_braille)
    return string_of_braille
  end

  def translate_to_english
    @english_message = Message.new
    string_of_lines = @message.content
    array_of_braille = split_braille_input(string_of_lines)
    string_of_english = convert_to_english(array_of_braille)
    @english_message.add_content(string_of_english)
    return string_of_english
  end

  def create_array_of_braille(array)
    array.map do |character|
      @dictionary.english_braille[character]
    end
  end

  def convert_braille_array_to_string(array)
    braille_string = ""
    if array.length <= 40
      stringify_braille_arrays(array, braille_string)
    else
      sort_long_braille_input(array, braille_string)
    end
  end

  def sort_long_braille_input(long_array, braille_string)
    while long_array.length > 40
      braille_string_front = ""
      array_front = long_array[0..39]
      long_array = long_array[40..(long_array.length)]
      braille_string_front = stringify_braille_arrays(array_front,
                                                      braille_string_front)
      braille_string += braille_string_front + "\n"
    end
    braille_string_remainder = ""
    string_memo = stringify_braille_arrays(long_array, braille_string_remainder)
    braille_string += string_memo
  end

  def stringify_braille_arrays(array, string)
    array.each do |character|
      string += character[0].join
    end
    string += "\n"
    array.each do |character|
      string += character[1].join
    end
    string += "\n"
    array.each do |character|
      string += character[2].join
    end
    string
  end

  def split_braille_input(string)
    braille_input_split = string.gsub(/[^0.\n]/, "$")
                                .split("\n")
    array_of_chars = []
    sort_lines_into_character_arrays(braille_input_split, array_of_chars)
    array_of_chars
  end

  def sort_lines_into_character_arrays(input_array, characters_array)
    while input_array.length >= 3
      top_line = input_array[0].chars
      middle_line = input_array[1].chars
      bottom_line = input_array[2].chars
      until top_line == [] do
        characters_array << [ [top_line[0] + top_line[1]],
                              [middle_line[0] + middle_line[1]],
                              [bottom_line[0] + bottom_line[1]] ]
        top_line.shift(2)
        middle_line.shift(2)
        bottom_line.shift(2)
      end
      input_array.slice!(0..2)
    end
  end

  def convert_to_english(array)
    string_of_english = array.map do |character|
      @dictionary.braille_english[character]
    end.join
    if string_of_english.length > 80
      string_of_english = wrap_english(string_of_english)
    end
    string_of_english
  end

  def wrap_english(string)
    string_memo = ""
    while string.length > 80
      string_memo = string[0..79]
      string = string[80..(string.length)]
      string_memo += "\n"
    end
    string_of_english = string_memo + string
    return string_of_english
  end
end

  # USE LOGIC FOR HANDLING NUMBERS???
  # def char_to_braille(char)
  #   if english_braille.has_key?(char)
  #     return english_braille[char]
  #   elsif numbers_braille.has_key?(char)
  #     return numbers_braille["#"], numbers_braille[char]
  #   else
  #     return [[" ", " "], [" ", " "], [" ", " "]]
  #   end
  # end
