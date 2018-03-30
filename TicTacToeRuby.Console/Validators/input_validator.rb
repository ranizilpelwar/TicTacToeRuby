require_relative '../Output/console_writer.rb'
require_relative '../Input/console_reader.rb'

module InputValidator
  def self.get_valid_selection(writer, reader, list_of_choices)
    puts "list_of_choices = "
    puts list_of_choices
    input = ""
    valid = false
    while !valid
      input = reader.read_input_ignore_empty
      puts "input = "
      puts input
      valid = list_of_choices.include?(input)
      puts "current state of valid = "
      puts valid
      writer.display_message("Oops! I couldn't use that. Please try again.") if !valid
    end
    result = input  
  end
end