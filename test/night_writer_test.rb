require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_prints_message_to_terminal
    skip
    assert_output(stdout = /Created 'braille.txt' containing 4 characters/,
                  stderr = nil)
  end
end
