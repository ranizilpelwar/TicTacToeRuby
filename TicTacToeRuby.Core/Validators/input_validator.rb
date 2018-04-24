require_relative '../Output/console_writer.rb'
require_relative '../Input/console_reader.rb'

module InputValidator
  def self.valid?
    return lambda { |input, valid_choices| valid = valid_choices.include?(input) }
  end
end