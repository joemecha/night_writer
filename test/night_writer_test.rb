require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_prints_message_to_user
    @write_file_name = "braille.txt"
    @read_file_characters = 26

    expected = "Created 'braille.txt' containing 26 characters"

    assert_equal expected, @night_writer.message_to_user
  end
end
