require_relative '../Output/console_writer.rb'
require_relative '../Output/message_generator.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Validators/input_validator.rb'
require_relative '../Input/yaml_reader.rb'
require_relative '../Output/yaml_writer.rb'

class LanguageSetup

  attr_reader :ui_writer, :ui_reader, :language_config
  
  def initialize(args)
    @ui_writer = args[:writer]
    @ui_reader = args[:reader]
    @language_config = args[:language_config]
  end

  def display_language_config_option
    @ui_writer.display_message(MessageGenerator.language_defaults_error) if !@language_config.valid?(@language_config.get_stored_default)
    @ui_writer.display_message(MessageGenerator.language_configuration)
    @ui_writer.display_message(MessageGenerator.line_spacer)
  end

  def display_language_configuration_screen
    @ui_writer.display_message(MessageGenerator.language_selection_prompt)
    @ui_writer.display_message(MessageGenerator.line_spacer)
    @ui_writer.display_message(MessageGenerator.language_options)
  end

  def get_user_selection
    input = InputValidator.get_valid_selection(@ui_writer, @ui_reader, @language_config.get_input_choices)
    language_tag = @language_config.get_language_tag_for(input)
    result = language_tag
  end

  def update_default_language(tag)
    @language_config.set_default_language_tag(tag)
  end

  def configure_language
    display_language_configuration_screen
    update_default_language(get_user_selection)
  end
end
