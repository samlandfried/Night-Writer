class NightWriter
attr_reader :rosetta_stone

  def initialize(input_file, output_file)
    @rosetta_stone = RosettaStone.new
  end
  #instance variable called count



  #2 parameters names of input and output files


  def open(input_file)
    file = File.open(input_file, "r")
    file
  end


  #count method characters file method?
  #read output file
  #return number of characters

  #write method
  def write(output_file, translated)
    #a string will be passed into it and that string will be written to the file specified in the instantiation
    file = File.open(output_file, "w")
    file.write translated
  end

  #print method
  #print to consule output file name and count method

end

# nw = NightWriter.new
# file = nw.open file.txt
# translated = translator.translate (file)
# nw.write output.txt, translated
