require_relative '../Output/console_writer.rb'
require_relative '../Input/console_reader.rb'

module InputValidator
  def self.get_valid_selection(writer, reader, list_of_valid_choices)
    input = ""
    valid = false
    while !valid
      input = reader.read_input_ignore_empty
      valid = valid?(input, list_of_valid_choices)
      writer.display_message(MessageGenerator.invalid_selection_error) if !valid
    end
    result = input  
  end

  def self.valid?
    return lambda { |input, valid_choices| valid = valid_choices.include?(input) }
  end
end