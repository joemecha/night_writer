class Message
  attr_reader :character_count,
              :content,

  def initialize
    @content = ""
    @character_count = 0
  end

  def add_content(characters)
    if characters.class == String # English input
      @content += characters
    else # Braille input
      @content += characters.join("\n")
    end
    @character_count = @content.length - @content.count("\n")
    is_braille?
  end

  def is_braille?
    @content.count("abcdefghijklmnopqrstuvwxyz\
                                ABCDEFGHIJKLMNOPQRSTUVWXYZ").zero?
  end
end
