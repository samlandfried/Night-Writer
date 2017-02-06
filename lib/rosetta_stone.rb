class RosettaStone

  # Create 3 arrays as instance variables
    # English alphabet =  " !',-.?abcdefghijklmnopqrstuvwxyz".split('')
    braille = File.open("lib/braille.txt", "r").read.split("\n")
    # Braille alphabet = braille
    # Modifiers = define from somewhere

  # Create four symbols :l, :r, :f, :e

  # Convert string Braille to symbol braille
  # Make an empty array braille_alphabet
  # Loop lenth of array times
    # create subarr
    #   Loop 3 times
      # Look at a pair of dots and assign them a symbol
      # Shovel symbol into array
    # Shovel subarr into braille_alphabet
    # Push them to an array

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

rs = RosettaStone.new
