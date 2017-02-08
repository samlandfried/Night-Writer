# gem 'minitest', '~> 5.0'
require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/rosetta_stone'
require './lib/night_writer'
require './lib/translator.rb'

class NightWriterTest < Minitest::Test

  describe "rosetta stone" do

    attr_accessor :english, :braille, :modifiers, :rs

    def setup
      nw = NightWriter.new("input.txt", "output.txt")
      @rs = nw.rosetta_stone

      @english = rs.english
      @braille = rs.braille
      @modifiers = rs.modifiers
    end

    def test_it_has_3_arrays
      assert english.instance_of? (Array)
      assert braille.instance_of? (Array)
      assert modifiers.instance_of? (Array)
    end

    def test_braille_sub_arrays_contain_symbols
      assert braille[0][0].instance_of? (Symbol)
    end

    def test_braille_array_contains_arrays
      assert braille[0].instance_of? (Array)
    end

    def test_english_array_contains_strings
      assert english[0].instance_of? (String)
    end

    def test_modifiers_array_contains_symbols
      assert modifiers[0][0].instance_of? (Symbol)
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
      file = File.new("data/input.txt", "r")
      assert file.read.instance_of? (String)
    end

    def test_it_makes_a_new_file
      refute File.exist?("data/fake_file.txt")
      nw = NightWriter.new("file.txt", "fake_file.txt")
      nw.write_file("Written!")
      assert File.exist?("data/fake_file.txt")
      File.delete("data/fake_file.txt")
      refute File.exist?("data/fake_file.txt")
    end

  end

  describe "English to Braille translation" do

    attr_accessor :english, :braille, :modifiers, :nw

    def setup
      @nw = NightWriter.new("input.txt", "output.txt")

      @english = nw.rosetta_stone.english
      @braille = nw.rosetta_stone.braille
      @modifiers = nw.rosetta_stone.modifiers
    end

    def test_it_outputs_braille # rosetta_stone tests
      assert_equal "..\n0.\n00", nw.rosetta_stone.convert_symbol_braille_to_string_braille([[:e, :l, :f]])
    end

    def test_it_translates_characters
      translation = nw.translator.translate_english_to_symbol_braille(english[14])
      translation = nw.rosetta_stone.convert_symbol_braille_to_string_braille(translation)
      assert_equal "0.\n00\n..", translation

    end

    def test_it_adds_shift_character

      assert_equal [[:e, :e, :r], [:l, :f, :e]], nw.translator.translate_english_to_symbol_braille("H")
    end

    def test_it_adds_number_character
      assert_equal [[:r, :r, :f],[:l, :f, :e]],nw.translator.translate_english_to_symbol_braille("8")
    end

    # def test_it_finds_errors

    # end

  end

  describe "Symbol-Braille to English translation" do
    attr_reader :nw, :english, :braille

    def setup
      @nw = NightWriter.new("input.txt", "output.txt")
      @english = nw.rosetta_stone.english
      @braille = nw.rosetta_stone.braille
    end

    def test_it_outputs_english
      assert_equal english[14], nw.translator.translate_symbol_braille_to_english([[:l, :f, :e]])
    end

    def test_it_capitalizes
      assert_equal "H", nw.translator.translate_symbol_braille_to_english([[:e, :e, :r],[:l, :f, :e]])
    end

    def test_it_adds_number_character
      assert_equal "8",nw.translator.translate_symbol_braille_to_english([[:r, :r, :f],[:l, :f, :e]])
    end

  end

  describe "command line" do
    attr_reader :nw

    def setup
      @nw = NightWriter.new("input.txt", "output.txt")
    end

    def test_it_prints
      printed = nw.print_output
      assert printed.include?("output.txt")
    end

    def test_it_includes_a_character_count
      printed = nw.write_file("goop")
      assert nw.print_output.include?("4")
    end

  end

end
