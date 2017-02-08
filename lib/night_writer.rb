require "./lib/rosetta_stone"
require "./lib/translator"

class NightWriter

  attr_reader :rosetta_stone, :translator, :input_path, :output_path

  attr_accessor :count

  def initialize(input_file = "data/input.txt", output_file = "output.txt")
    @rosetta_stone = RosettaStone.new
    @translator = Translator.new
    @input_path = ARGV[0] || input_file
    @output_path = ARGV[1] || output_file
    @count = 0
  end



  #2 parameters names of input and output files


  def open(input_file)
    file = File.open("data/" + input_file, "r").read
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

nw = NightWriter.new
file = nw.open nw.input_path
symbol_braille = nw.translator.translate_english_to_symbol_braille(file)
string_braille = nw.rosetta_stone.convert_symbol_braille_to_string_braille(symbol_braille)
nw.write_file string_braille
nw.print_output
