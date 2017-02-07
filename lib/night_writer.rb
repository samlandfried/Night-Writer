class NightWriter

attr_reader :rosetta_stone, :input_path, :output_path

  def initialize(input_file, output_file)
    @rosetta_stone = RosettaStone.new
    @input_path = input_file
    @output_path = output_file
  end



  #2 parameters names of input and output files


  def open
    file = File.open(input_path, "r").read
    file
  end


  #count method characters file method?
  #read output file
  #return number of characters

  #write method
  def write(translated)
    #a string will be passed into it and that string will be written to the file specified in the instantiation
    file = File.open("data/" + output_path, "w")
    file.write translated
  end

  #print method
  #print to consule output file name and count method

end

# nw = NightWriter.new
# file = nw.open file.txt
# translated = translator.translate (file)
# nw.write output.txt, translated
