require_relative '../Output/console_writer.rb'
require_relative '../Output/message_generator.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Validators/input_validator.rb'
require_relative '../Input/yaml_reader.rb'
require_relative '../Output/yaml_writer.rb'

class LanguageSetup

  attr_reader :reader, :writer, :language_config
  
  def initialize(args)
    @reader = args[:reader]
    @writer = args[:writer]
    @language_config = args[:language_config]
    raise NilReferenceError, "reader" if @reader.nil?
    raise NilReferenceError, "writer" if @writer.nil?
    raise NilReferenceError, "language_config" if @language_config.nil?
  end

  def display_prompt
    @writer.display_message(error_message) if !@language_config.valid?(@language_config.stored_default_tag)
    @writer.display_text(MessageGenerator.language_configuration_prompt)
  end

  def display_options
    @writer.display_message(MessageGenerator.language_configuration_option)
    @writer.display_message(MessageGenerator.line_spacer)
  end

  def config_options
    language_selections = ["L", "l"]
  end

  def error_message
    MessageGenerator.language_defaults_error
  end
end
