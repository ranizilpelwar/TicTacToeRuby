require_relative '../Output/console_writer.rb'
require_relative '../Output/message_generator.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Validators/input_validator.rb'

module LanguageSetup

  @localization = "en"

  def self.set_localization(language)
    @localization = language
  end

  def self.get_current_localization
    result = @localization
  end

  def get_language_selection(writer, reader)
    options = YAMLReader.read_data("language_options", "languages")
    count = options.size
    valid_selections = []
    iterator = 0 
    count.times do
      valid_selections << options[iterator]
      iterator = iterator + 1
    end
    input = InputValidator.get_valid_selection
    
  end


end