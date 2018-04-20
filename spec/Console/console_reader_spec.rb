require_relative '../../TicTacToeRuby.Console/Input/console_reader.rb'
require_relative '../../TicTacToeRuby.Console/Validators/input_validator.rb'

RSpec.describe ConsoleReader do
  describe "#read_and_validate" do
    it "returns correct input value if it is valid the first time" do
      console_reader = ConsoleReader.new
      allow(console_reader).to receive(:read_input_ignore_empty).and_return("1")
      input = console_reader.read_and_validate(InputValidator.valid?, ["1", "2", "3"])
      expect(input).to eq("1")
    end 

    it "retries input if it is invalid the first time" do
      console_reader = ConsoleReader.new
      allow(console_reader).to receive(:read_input_ignore_empty).and_return("10", "2")
      input = console_reader.read_and_validate(InputValidator.valid?, ["1", "2", "3"])
      expect(input).to eq("2")
    end 

    it "retries input if it is invalid the first four times" do
      console_reader = ConsoleReader.new
      allow(console_reader).to receive(:read_input_ignore_empty).and_return("10", "12", "X", "", "3")
      input = console_reader.read_and_validate(InputValidator.valid?, ["1", "2", "3"])
      expect(input).to eq("3")
    end 

    it "only iterates through the loop once if it is valid the first time" do
      console_reader = ConsoleReader.new
      allow(console_reader).to receive(:read_input_ignore_empty).and_return("1", "12", "X", "", "3")
      input = console_reader.read_and_validate(InputValidator.valid?, ["1", "2", "3"])
      expect(input).to eq("1")
    end 
  end
end