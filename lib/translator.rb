require "./lib/rosetta_stone"

class Translator

  attr_reader :english, :braille, :modifiers

  def initialize
    rs = RosettaStone.new
    @english = rs.english
    @braille = rs.braille
    @modifiers = rs.modifiers
  end

  def translate_symbol_braille_to_english braille_to_translate
    flag = "lower_case"
    skip = false
    translated = []

    braille_to_translate.each do |char|
      if char == modifiers[0]
        flag = "shift"
        skip = true
        next
      elsif char == modifiers[1]
        flag = "number"
        skip = true
        next
      elsif skip = false
        flag = "lower_case"
      end

      skip = false
      case flag
      when "lower_case"
        alphabet_position = braille.index(char)
        translated << english[alphabet_position]
      when "shift"
        alphabet_position = braille.index(char)
        translated << english[alphabet_position].upcase
      when "number"
        alphabet_position = braille.index(char)
        translated << (alphabet_position - 6).to_s
      end
    end
    translated.join
  end

  def translate_english_to_symbol_braille string_to_translate
    characters = string_to_translate.split("")
    translated = []
    numbers = "1234567890".split("")

    characters.each do |char|
      if char.upcase == char
        translated << modifiers[0] if char.upcase == char
      elsif numbers.include? (char)
        translated << modifiers[1] if numbers.include? char
      end
      alphabet_position = english.index(char.downcase)
      translated << braille[alphabet_position]
    end

    translated
  end

end
