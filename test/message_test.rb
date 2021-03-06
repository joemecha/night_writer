require 'minitest/autorun'
require 'minitest/pride'
require './lib/message'

class MessageTest < Minitest::Test
  def setup
    @message1 = Message.new
  end

  def test_it_exists
    assert_instance_of Message, @message1
  end

  def test_it_has_attributes
    assert_equal 0, @message1.character_count
    assert_nil @message1.english
    assert_nil @message1.braille
  end

  def test_add_content
    characters = "some letters"
    @message1.add_content(characters)

    assert_equal characters, @message1.content
    assert_equal 12, @message1.character_count
  end

  def test_is_braille
    @message2 = Message.new
    characters = "..0.00.0"
    @message2.add_content(characters)

    assert_equal true, @message2.is_braille?

    @message3 = Message.new
    characters = "abc."
    @message3.add_content(characters)
    assert_equal false, @message3.is_braille?
  end
end
