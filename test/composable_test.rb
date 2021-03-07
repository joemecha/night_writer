require 'minitest/autorun'
require 'minitest/pride'
require './lib/composable'
require 'mocha/minitest'

class ComposableTest < Minitest::Test
  def setup
    @nite_riter = DummyClass.new
  end

  def test_read_message_file
    skip 
    @nite_riter.read_message_file("test_message.txt")
    assert_equal ["a"], @nite_riter.message
  end

  def test_write_file
    skip
    @message = "Is this thing on?"
    @nite_riter.write_file("test.txt")
  end

  def test_message_to_user
    skip
    expected = "Created 'test.txt' containing 0 characters"
    assert_equal expected, @nite_riter.message_to_user
  end
end

class DummyClass
  include Composable
  attr_reader :read_file_name,
              :write_file_name,
              :read_file_chars

  def initialize
    @read_file_name = "test_message.txt"
    @write_file_name = "test.txt"
    @read_file_chars = 0
  end
end
