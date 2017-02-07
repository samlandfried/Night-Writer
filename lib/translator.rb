require "./lib/rosetta_stone"

class Translator

  attr_reader :english, :braille

  def initialize
    rs = RosettaStone.new
    @english = rs.english
    @braille = rs.braille
  end

  def translate_braille_to_english braille
    #untranslated and translated variable
    untranslated = []

    # An empty array to hold the result
    # Iterate over untranslated
      # Use rosetta_stone to find equivalent value
      # Shovel new value into storage array
    # Convert storage into a string
    # Return string
    english
  end

  def translate_english_to_braille string_to_translate
    characters = string_to_translate.split("")

    characters.map do |char|
      alphabet_position = english.index(char) 
      braille[alphabet_position]
    end 
  end

end
