require "./lib/rosetta_stone"

class Translator

  attr_reader :english, :braille

  def initialize
    rs = RosettaStone.new
    @english = rs.english
    @braille = rs.braille
  end

  def translate_symbol_braille_to_english braille_to_translate

    braille_to_translate.map! do |char|
      alphabet_position = braille.index(char)
      require "pry"; binding.pry
      english[alphabet_position]
    end
    braille_to_translate.join
  end

  def translate_english_to_braille string_to_translate
    characters = string_to_translate.split("")

    characters.map do |char|
      alphabet_position = english.index(char)
      braille[alphabet_position]
    end
  end

end
