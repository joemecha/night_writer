require 'minitest/autorun'
require 'minitest/pride'
require './lib/message'

class MessageTest < Minitest::Test
  def setup
    @message1 = Message.new
    @message2 = Message.new
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
    characters = "..0.00.0"
    @message1.add_content(characters)

    characters2 = "abc."
    @message2.add_content(characters2)

    assert_equal true, @message1.braille
    assert_equal false, @message2.braille 
  end
end
