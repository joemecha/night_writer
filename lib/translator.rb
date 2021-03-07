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
                             .gsub(/[^a-z .,]/i, "$")
                             .chars
    array_of_braille = create_array_of_braille(english_input_split)
    string_of_braille = convert_braille_array_to_string(array_of_braille)
    @braille_message.add_content(string_of_braille)
    return string_of_braille
  end

  def translate_to_english
    @english_message = Message.new
    # Add flow control to handle more than a 3-line row of braille

    # Format braille string input into three rows
    braille_input_split = @message.content
                                  .gsub(/[^0.\n]/, "$")
                                  .split("\n")
    top_line = braille_input_split[0].chars
    middle_line = braille_input_split[1].chars
    bottom_line = braille_input_split[2].chars

    # Sort three rows into collections representing each character
    array_of_chars = []
    until top_line == [] do
      array_of_chars << [[top_line[0] + top_line[1]],
                          [middle_line[0] + middle_line[1]],
                          [bottom_line[0] + bottom_line[1]]
                         ]
      top_line.shift(2)
      middle_line.shift(2)
      bottom_line.shift(2)
    end
    # Convert braille characters to english create_string_of_english(array)
    string_of_english = array_of_chars.map do |character|
      @dictionary.braille_english[character]
    end.join
    require "pry"; binding.pry
  end

  def create_array_of_braille(array)
    array.map do |character|
      @dictionary.english_braille[character]
    end
  end

  def convert_braille_array_to_string(array)
    braille_string = ""
    braille_string_1 = ""
    if array.length <= 40
      stringify_and_wrap_braille_arrays(array, braille_string)
    else
      while array.length > 40
        array_1 = array[0..39]
        array = array[40..(array.length)]
        string_memo =
        stringify_and_wrap_braille_arrays(array_1, braille_string_1)
        braille_string_1 += string_memo + "\n\n"
      end
      string_memo = stringify_and_wrap_braille_arrays(array, braille_string)
      braille_string = braille_string_1 + string_memo
    end
  end

  def stringify_and_wrap_braille_arrays(array, braille_string)
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
