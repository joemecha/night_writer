require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_writer'
require './lib/translator'
require './lib/dictionary'
require './lib/message'

class NightWriterTest < Minitest::Test
  def setup
    skip
    @night_writer = NightWriter.new
  end

  def test_it_exists
    skip
    assert_instance_of NightWriter, @night_writer
  end

  def test_it_has_attributes
    skip
    assert_equal 3, @night_writer.ARGV.length
  end

  def test_translate_to_braille
    skip
    @message = "a"
    expected = [["0", "."], [".", "."], [".", "."]]

    assert_equal expected, @night_writer.translate_to_braille
  end
end
