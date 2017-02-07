# gem 'minitest', '~> 5.0'
require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/rosetta_stone'
require './lib/night_writer'
require 'pry'

class NightWriterTest < Minitest::Test
  # describe "rosetta stone" do
    attr_accessor :english, :braille, :modifiers, :rs

    def setup
      nw = NightWriter.new("input.txt", "output.txt")
      @rs = nw.rosetta_stone

      @english = rs.english
      @braille = rs.braille
      @modifiers = rs.modifiers
    end

    def test_it_has_3_arrays
      # binding.pry-byebug
      assert english.instance_of? (Array)
      assert braille.instance_of? (Array)
      assert modifiers.instance_of? (Array)
    end

    def test_braille_sub_arrays_contain_symbols
      skip
      assert braille[0][0].instance_of? (Symbol)
    end

    def test_braille_array_contains_arrays
      rs.convert_string_braille_to_symbol_braille
      assert braille[0].instance_of? (Array)
    end

    def test_english_array_contains_strings
      assert english[0].instance_of? (String)
    end

    def test_modifiers_array_contains_symbols
      skip
      assert modifiers[0].instance_of? (Symbol)
    end

    def test_it_matches_characters
      skip
      assert_equal "h", english[14]
      assert_equal [:l,:f,:e], braille[14]
    end

    def test_braille_array_has_33_elements
      skip
      assert_equal 33, braille.size
    end

  # end

  describe "file IO" do

    def test_it_produces_a_string
      skip
      file = File.new("input.txt", "r")
      assert file.instance_of? ("String")
    end

    def test_it_makes_a_new_file
      skip
      refute File.exist?("fake_file.txt")
      nw = NightWriter.new("file.txt", "fake_file.txt")
      assert File.exist?("fake_file.txt")
      File.delete("fake_file.txt")
      refute File.exist?("fake_file.txt")
    end


  end

  describe "English to Braille translation" do # Sam does this

    def test_it_outputs_braille
      assert_equal ["..\nO.\nOO"], NightWriter.translator[:l, :f, :e]
    end

    def test_it_translates_characters
      assert_equal "h", NightWriter.translator(english[14])
    end

    def test_it_adds_shift_character
      assert_equal ["..O.\n..OO\n.O.."], NightWriter.translator("H")
    end

    # def test_it_finds_errors

    # end

    def it_counts_characters
      assert_equal 1, NightWriter.translator("h")
    end

  end

  describe "Braille to English translation" do # Natalie does this

    def test_it_outputs_english
      skip
      assert_equal "h", NightWriter.translator[:l, :f, :e]
    end

    def test_it_translates_characters
      skip
      assert_equal english[14], NightWriter.translator[:l, :f, :e]
    end

    def test_it_capitalizes
      skip
      assert_equal "H", NightWriter.translator[[:e, :e, :r][:l, :f, :e]]
    end

    def test_it_finds_errors
      skip
      #look into this later
    end

    def test_it_counts_characters
      skip
      assert_equal 1, NightWriter([:l, :f, :e]).length
    end

  end

  describe "command line" do

    def test_it_includes_a_file_name
      skip
      printed = nw.print_output
      assert printed.include?("output.txt")
    end

    def test_it_puts
      skip
      # If there's time, investigte spys
    end


    def test_it_includes_a_character_count
      skip
      printed = nw.print_output
      assert printed.include?("4")
    end

  end

end
