class Message
  attr_reader :character_count,
              :content,
              :braille

  def initialize
    @content = ""
    @character_count = 0
    @braille = nil
  end

  def add_content(characters)
    if characters.class == String
      @content += characters
    else
      @content += characters.join("\n")
    end
    @character_count = @content.delete(".0.000").length - @content.count("\n")
    is_braille?
  end

  def is_braille?
    @braille = @content.count("abcdefghijklmnopqrstuvwxyz123456789").zero?
    return @braille
  end
end
