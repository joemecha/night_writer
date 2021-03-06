require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_writer'
require '.lib/translator'
require './lib/dictionary'
require '.lib/message'

class NightWriterTest < Minitest::Test
  def setup
    @dictionary = Dictionary.new
    @night_writer = NightWriter.new(@dictionary)
  end

  def test_it_exists
    skip
    assert_instance_of NightWriter, @night_writer
  end

  def test_it_has_attributes
    skip
    assert_equal @dictionary, @night_writer.dictionary
  end

  def test_translate_to_braille
    @message = "a"
    expected = [["0", "."], [".", "."], [".", "."]]

    assert_equal expected, @night_writer.translate_to_braille
  end
end
