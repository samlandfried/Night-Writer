gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/emoji'
# require_relative '../lib/rosetta_stone'

class NightWriterTest < Minitest::Test

  def setup
    nw = NightWriter.new("input.txt", "output.txt")
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
      file = File.new("input.txt", "r")
      assert file.instance_of? ("String")
    end

    def test_it_makes_a_new_file
      refute File.exist?("fake_file.txt")
      nw = NightWriter.new("file.txt", "fake_file.txt")
      assert File.exist?("fake_file.txt")
      File.delete("fake_file.txt")
      refute File.exist?("fake_file.txt")
    end


  end

  describe "English to Braille translation" do # Sam does this

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

  describe "Braille to English translation" do # Natalie does this

    def test_it_contains_3_row
      assert_equal 3, translator[0].length
    end

    def test_it_outputs_english
      assert_equal "h", NightWriter.translator[:l, :f, :e]
    end

    def test_it_translates_characters
      assert_equal english[14], NightWriter.translator[:l, :f, :e]
    end

    def test_it_capitalizes
      assert_equal "H", NightWriter.translator[[:e, :e, :r][:l, :f, :e]]
    end

    def test_it_finds_errors
      #look into this later
    end

    def test_it_counts_characters
      assert_equal 1, NightWriter([:l, :f, :e]).length
    end

  end

  describe "command line" do

    def test_it_includes_a_file_name
      printed = nw.print_output
      assert printed.include?("output.txt")
    end

    def test_it_puts
      # If there's time, investigte spys
    end


    def test_it_includes_a_character_count
      printed = nw.print_output
      assert printed.include?("4")
    end

  end

end
