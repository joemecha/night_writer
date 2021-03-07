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

  def test_braille_english
    expected = "d"
    expected1 = "e"
    expected2 = "?"
    assert_equal expected, @dictionary.braille_english[[["00"], [".0"], [".."]]]
    assert_equal expected1, @dictionary.braille_english[[["0."], [".0"], [".."]]]
    assert_equal expected2, @dictionary.braille_english[[[".."], ["0."], ["00"]]]

  end

  def test_braille_numbers
    expected = "1"
    expected1 = "3"
    expected2 = "5"
    assert_equal expected, @dictionary.braille_numbers[[["0."], [".."], [".."]]]
    assert_equal expected1, @dictionary.braille_numbers[[["00"], [".."], [".."]]]
    assert_equal expected2, @dictionary.braille_numbers[[["0."], [".0"], [".."]]]
  end
end
