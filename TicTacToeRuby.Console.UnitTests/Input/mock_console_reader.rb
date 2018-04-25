class MockConsoleReader
  
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def read_input
    @input
  end

  def read_input_ignore_empty
    @input
  end

  def read_and_validate(callback, valid_input_choices, writer, message)
    @input
  end
end