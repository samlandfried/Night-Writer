class RosettaStone

  attr_reader :english, :braille, :modifiers

  def initialize
    @english = " !',-.?abcdefghijklmnopqrstuvwxyz".split('')
    @braille = convert_string_braille_to_symbol_braille(File.open("data/braille.txt", "r").read)
    @modifiers = [[:e,:e,:r],[:r,:r,:f]]
    @symbol_braille = [:l, :r, :f, :e]
  end

  # Convert string Braille to symbol braille
  def convert_string_braille_to_symbol_braille(string_braille)
    braille = string_braille.split("\n")
    symbol_braille = []
    # Loop number of braille pairs times
    (braille[0].length/2).times do |pair_index_position|
      subarr = []
      3.times do |row|
        # Look at a pair of dots and assign them a symbol
        pair = braille[row][pair_index_position * 2..pair_index_position * 2 + 1]
        subarr << :l if pair == "0."
        subarr << :r if pair == ".0"
        subarr << :e if pair == ".."
        subarr << :f if pair == "00"
      end
      symbol_braille << subarr
    end
    symbol_braille
  end

  # [[:e, :f, :r], [:r, :f, :f], ...]
  def convert_symbol_braille_to_string_braille(symbol_braille)
    rows = ["","",""]

    symbol_braille.each do |element|
      3.times do |row|
        symbol = element[row]
        rows[row] += "0." if :l == symbol
        rows[row] += ".0" if :r == symbol
        rows[row] += ".." if :e == symbol
        rows[row] += "00" if :f == symbol
        # require "pry"; binding.pry
      end
    end

    rows = rows.join("\n")
    rows
  end
  # Braille alphabet = braille

  # Modifiers = define from somewhere

  # Create four symbols :l, :r, :f, :e

  #convert symbol braille to string braille
  #input is an array of symbol braille elements
  #row 1 string
  #row 2 string
  #row 3 string
  #iterate over input
  #iterate over symbol braille elements
  #convert the symbols in row i using rosetta_stone
  #concat converted symbol to row i string
  #push rows into an array
  #return array

end
