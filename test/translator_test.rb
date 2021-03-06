require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'
require './lib/dictionary'
require './lib/message'

class TranslatorTest < Minitest::Test
  def setup
    @characters_1 = "abc"
    @message_1 = Message.new
    @message_1.add_content(@characters_1)
    @translator = Translator.new(@message_1)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    assert_equal @message_1, @translator.message
  end

  def test_translate_to_braille
    expected = "0.0.00\n..0...\n......"
    assert_equal expected, @translator.translate_to_braille
  end

  def test_translate
    expected = "0.0.00\n..0...\n......"
    assert_equal expected, @translator.translate
  end

  def test_width_greater_than_40
  end 
end
