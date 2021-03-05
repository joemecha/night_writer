require 'minitest/autorun'
require 'minitest/pride'
require './lib/dictionary'

class DictionaryTest < Minitest::Test
  def setup
    @dictionary = Dictionary.new
  end

  def test_it_exists
    assert_instance_of Dictionary, @dictionary
  end

  def test_english_braille
    expected = [["0", "."], [".", "."], [".", "."]]
    expected2 = [["0", "."], [".", "0"], [".", "."]]
    expected3 = [[".", "."], [".", "."], [".", "."]]

    assert_equal true, @dictionary.english_braille.has_key?("a")
    assert_equal expected, @dictionary.english_braille["a"]
    assert_equal true, @dictionary.english_braille.has_key?("e")
    assert_equal expected2, @dictionary.english_braille["e"]
    assert_equal true, @dictionary.english_braille.has_key?(" ")
    assert_equal expected3, @dictionary.english_braille[" "]
  end

  def test_numbers_braille
    expected = [["0", "."], [".", "."], [".", "."]]
    expected2 = [["0", "."], [".", "0"], [".", "."]]
    expected3 = [[".", "0"], [".", "0"], ["0", "0"]]


    assert_equal true, @dictionary.numbers_braille.has_key?("1")
    assert_equal expected, @dictionary.numbers_braille["1"]
    assert_equal true, @dictionary.numbers_braille.has_key?("5")
    assert_equal expected2, @dictionary.numbers_braille["5"]
    assert_equal true, @dictionary.numbers_braille.has_key?("#")
    assert_equal expected3, @dictionary.numbers_braille["#"]
  end

  def test_char_to_braille
    char = "a"
    expected = [["0", "."], [".", "."], [".", "."]]
    char2 = "8"
    expected2 = [[".", "0"], [".", "0"], ["0", "0"]], [["0", "."], ["0", "0"], [".", "."]]

    assert_equal expected, @dictionary.char_to_braille(char)
    assert_equal expected2, @dictionary.char_to_braille(char2)
  end
end
