require "./lib/rosetta_stone"
require "./lib/translator"

class NightWriter

  attr_reader :rosetta_stone, :translator, :input_path, :output_path

  attr_accessor :count

  def initialize(input_file, output_file)
    @rosetta_stone = RosettaStone.new
    @translator = Translator.new
    @input_path = input_file
    @output_path = output_file
    @count = 0
  end



  #2 parameters names of input and output files


  def open(input_file)
    file = File.open(input_file, "r").read
    file
  end

  #count method characters file method?
  #read output file
  #return number of characters

  #write method
  def write_file(translated)
    @count = translated.length
    file = File.open("data/" + output_path, "w")
    file.write translated
  end
  #a string will be passed into it and that string will be written to the file specified in the instantiation

  def print_output
    p "Created #{output_path} containing #{@count} characters"
  end
  #print method
  #print to consule output file name and count method
  # Created 'braille.txt' containing 256 characters
end

# nw = NightWriter.new
# file = nw.open file.txt
# translated = translator.translate (file)
# nw.write output.txt, translated
