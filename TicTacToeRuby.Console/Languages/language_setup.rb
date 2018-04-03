require_relative '../Output/console_writer.rb'
require_relative '../Output/message_generator.rb'
require_relative '../Input/console_reader.rb'
require_relative '../Validators/input_validator.rb'
require_relative '../Input/yaml_reader.rb'

module LanguageSetup

  def self.set_localization(language_tag)
    raise ArgumentError, MessageGenerator.argument_error("set_localization", "language_tag", "nil") if language_tag.nil?
    raise ArgumentError, MessageGenerator.argument_error("set_localization", "language_tag", "an invalid value") if !(get_language_tags.include?(language_tag))
    @localization = language_tag
  end

  def self.get_localization
    @localization ||= YAMLReader.read_data("TicTacToeRuby.Console/Languages/global_settings.yaml", "selected_language_tag")
  end

  def self.set_selected_language(writer, reader)
    language_tag_options = get_language_tags
    list_of_input_choices = get_input_choices
    input = InputValidator.get_valid_selection(writer, reader, list_of_input_choices)
    language_tag = language_tag_options[input.to_i - 1]['tag']
    configure_language(language_tag)
  end

  def self.get_languages_hash
    file_path = MessageGenerator.generate_file_path("language_options", get_localization)
    raise ArgumentError, MessageGenerator.argument_error("get_languages_hash", "file_path", "non-existent") if !(File.exist?(file_path))
    options = YAMLReader.read_data(file_path, "languages")
  end

  def self.get_languages
    options = get_languages_hash
    languages = []
    options.each do |language|
      languages << language['description']
    end
    result = languages
  end

  def self.get_input_choices
    options = get_languages_hash
    count = options.size
    valid_selections = [*1..count]
    valid_selections = valid_selections.map(&:to_s)
    result = valid_selections
  end

  def self.get_language_tags
    options = get_languages_hash
    tags = []
    options.each do |language|
      tags << language['tag']
    end
    result = tags
  end

  def self.get_language_tag(input_choice)
    input = input_choice.to_i
    options = get_languages_hash
    tag = options[input - 1]['tag']
  end
end
