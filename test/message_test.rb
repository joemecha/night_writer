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

end
