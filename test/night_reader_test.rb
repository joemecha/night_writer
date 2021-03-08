require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_reader'
require './lib/translator'
require './lib/dictionary'
require './lib/message'

class NightReaderTest < Minitest::Test
  def setup
    @night_reader = NightReader.new
  end

  def test_it_exists
    skip
    assert_instance_of NightReader, @night_reader
  end

  def test_it_has_attributes
    skip
    assert_equal 3, @night_reader.ARGV.length
  end

  def test_translate_to_braille
    skip
    @message = "0.
    ..
    .."
    expected = ["a"]

    assert_equal expected, @night_reader.translate_to_english
  end
end
