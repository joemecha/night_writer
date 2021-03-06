class Message
  attr_reader :character_count,
              :content,
              :english,
              :braille

  def initialize
    @content = ""
    @character_count = 0
    @braille = nil
    @english = nil
  end

  def add_content(characters)
    if characters.class == String
      @content += characters
      @character_count = @content.length
      is_braille?
    end
  end

  def is_braille?
    @braille = @content.count("abcdefghijklmnopqrstuvwxyz").zero?
    @english != @braille
    return @braille  
  end
end
