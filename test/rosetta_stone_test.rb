gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/emoji'
# require_relative '../lib/rosetta_stone'

class NightWriterTest < Minitest::Test

  def setup
    nw = NightWriter.new
    rs = nw.rosetta
    english = rs[0]
    braille = rs[1]
    modifiers = rs[2]
  end
  describe "rosetta stone" do

    def test_it_has_3_arrays
      assert english.instance_of? (Array)
      assert braille.instance_of? (Array)
      assert modifiers.instance_of? (Array)
    end

    def test_braille_sub_arrays_contain_symbols
      assert braille[0][0].instance_of? ("Symbol")
    end

    def test_braille_array_contains_arrays
      assert braille[0].instance_of? ("Array")
    end

    def test_english_array_contains_strings
      assert english[0].instance_of? ("String")
    end

    def test_modifiers_array_contains_symbols
      assert modifiers[0].instance_of? ("Symbol")
    end

    def test_it_matches_characters
      assert_equal "h", english[14]
      assert_equal [:l,:f,:e], braille[14]
    end

    def test_braille_array_has_33_elements
      assert_equal 33, braille.size
    end

  end

  describe "file IO" do

    def test_it_produces_a_string
      file = File.new("file_test.txt", "r")
      assert file.instance_of? ("String")
    end

    def test_it_makes_a_new_file
      refute File.exist?("fake_file.txt")
      File.new("fake_file.txt", "w")
      assert File.exist?("fake_file.txt")
      File.delete("fake_file.txt")
      refute File.exist?("fake_file.txt")
    end


  end

  describe "English to Braille translation" do

    def test_it_contains_1_row
    end

    def test_it_outputs_braille
    end

    def test_it_translates_characters
    end

    def test_it_adds_shift_character
    end

    def test_it_finds_errors
    end

    def it_counts_characters
    end

  end

  describe "Braille to English translation" do

    def test_it_contains_3_row
    end

    def test_it_outputs_english
    end

    def test_it_translates_characters
    end

    def test_it_capitalizes
    end

    def test_it_finds_errors
    end

    def it_counts_characters
    end

  end

  describe "command line" do

    def test_it_includes_a_file_name

    end

    def test_it_puts
    end

    def test_it_does_something_to_a_file_name
    end

    def test_it_includes_a_character_count
    end


  end

end
