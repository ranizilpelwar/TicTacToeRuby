class MockConsoleReader
  
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def read_input
    return @input
  end

  def read_input_ignore_empty
    return @input
  end
end