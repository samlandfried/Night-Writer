class RosettaStone

  attr_accessor :english, :braille, :modifiers

  def initialize
    @english = " !',-.?abcdefghijklmnopqrstuvwxyz".split('')
    @braille = []
    @modifiers = []
    @symbol_braille = [:l, :r, :f, :e]
  end

  # Convert string Braille to symbol braille
  def convert_string_braille_to_symbol_braille
    # Make an empty array braille_alphabet
    file = File.open("./data/braille.txt")
    # Loop lenth of array times
    braille = file.read.split("\n")
    33.times do

    end
      # create subarr
      subarr = []
      # Loop 3 times
      3.times do |n|
        # Look at a pair of dots and assign them a symbol
        braille[n][?]
        # Shovel symbol into array
      # Shovel subarr into braille_alphabet
      end
    end
    # Push them to an array
  end


end
  # Create 3 arrays as instance variables
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




rs = RosettaStone.new
