require_relative '../Output/console_writer.rb'
require_relative '../Output/message_generator.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Validators/input_validator.rb'
require_relative '../Input/yaml_reader.rb'

module LanguageSetup

  @localization = "en"

  def self.set_localization(language)
    @localization = language
  end

  def self.get_current_localization
    result = @localization
  end

  def self.set_selected_language(writer, reader)
    language_tag_options = get_language_options
    list_of_input_choices = generate_input_choices(language_tag_options)
    input = InputValidator.get_valid_selection(writer, reader, list_of_input_choices)
    language_tag = language_tag_options[input.to_i - 1]['tag']
    configure_language(language_tag)
  end

  def self.get_language_options
    options = YAMLReader.read_data("language_options", "languages")
  end

  def self.generate_input_choices(options)
    puts "start LanguageSetup generate_input_choices: "
    count = options.size
    valid_selections = [*1..count]
    valid_selections = valid_selections.map(&:to_s)
    puts "valid_selections = "
    puts valid_selections 
    puts ":end LanguageSetup generate_input_choices"
    result = valid_selections
  end

  def self.configure_language(language_tag)
    @localization = language_tag
  end
end
