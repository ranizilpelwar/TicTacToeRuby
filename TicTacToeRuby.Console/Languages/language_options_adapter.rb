require_relative '../../TicTacToeRuby.Console/Input/yaml_reader.rb'
require_relative '../../TicTacToeRuby.Console/Output/yaml_writer.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'
require_relative '../../TicTacToeRuby.Core/Languages/language.rb'

class LanguageOptionsAdapter

  DEFAULT_LANGUAGE_TAG = "en"

  GLOBAL_SETTINGS_FILE = "global_settings.yaml"

  attr_reader :language, :directory

  def initialize(directory_path)
    @directory = directory_path
    tag = get_stored_default
    tag = DEFAULT_LANGUAGE_TAG if !valid?(tag)
    @language = Language.new(tag)
  end

  def get_language_tag
    result = @language.tag.to_s
  end
  
  def get_stored_default
    YAMLReader.read_data(@directory + GLOBAL_SETTINGS_FILE, "selected_language_tag")
  end

  def valid?(tag)
    file_path = @directory + "language_options." + tag + ".yaml"
    File.exist?(file_path)
  end

  def set_default_language_tag(tag)
    raise InvalidValueError, "tag" if !valid?(tag)
    YAMLWriter.write_data(@directory + GLOBAL_SETTINGS_FILE, "selected_language_tag", tag)
    @language.tag = tag
  end

  def get_languages_hash
    file_path = @directory + "language_options." + get_language_tag + ".yaml"
    YAMLReader.read_data(file_path, "languages")
  end

  def get_language_descriptions
    options = get_languages_hash
    languages = []
    options.each do |language|
      languages << language['description']
    end
    result = languages
  end

  def get_input_choices
    options = get_languages_hash
    count = options.size
    valid_selections = [*1..count]
    valid_selections = valid_selections.map(&:to_s)
  end

  def get_language_tags
    options = get_languages_hash
    tags = []
    options.each do |language|
      tags << language['tag']
    end
    result = tags
  end

  def get_language_tag_for(input_choice)
    input = input_choice.to_i
    options = get_languages_hash
    tag = options[input - 1]['tag']
  end
end