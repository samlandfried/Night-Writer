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
        if char == "0"
          translated << "0"
        else
          translated << (alphabet_position - 6).to_s
        end
      end
    end
    translated.join
  end

  def translate_english_to_symbol_braille string_to_translate
    characters = string_to_translate.split("")
    translated = []
    numbers = "1234567890".split("")

    characters.each do |char|
      if char.upcase == char && !numbers.include?(char)
        alphabet_position = english.index(char.downcase)
        translated << modifiers[0]
        translated << braille[alphabet_position]
      elsif numbers.include? (char)
        #### It was trying to add 7 to "1", a string version of 1, so I added .to_i
        #### Also, right now, it looks like 7 is the wrong value to add. Let's try 6 and 8.
        #### Also, what will happen when we try to retrieve the appropriate index position for "0"?
        number_position = char.to_i + 6
        number_position = 16 if char == "0"
        translated << modifiers[1]
        translated << braille[number_position]
      else
        alphabet_position = english.index(char.downcase)
        translated << braille[alphabet_position]
      end
    end

    translated
  end

end
