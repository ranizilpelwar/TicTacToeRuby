require_relative '../../TicTacToeRuby.Core/Languages/yaml_reader.rb'
require_relative '../../TicTacToeRuby.Core/Languages/yaml_writer.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'
require_relative '../../TicTacToeRuby.Core/Languages/language.rb'

class LanguageOptionsAdapter

  DEFAULT_LANGUAGE_TAG = "en"

  GLOBAL_SETTINGS_FILE = "global_settings.yaml"

  attr_reader :language, :directory

  def initialize(directory_path)
    @directory = directory_path
    tag = stored_default_tag
    tag = DEFAULT_LANGUAGE_TAG if !valid?(tag)
    @language = Language.new(tag)
  end

  def default_language_tag
    result = @language.tag.to_s
  end
  
  def stored_default_tag
    path = @directory + GLOBAL_SETTINGS_FILE
    YAMLReader.read_data(path, "selected_language_tag")
  end

  def valid?(tag)
    file_path = @directory + "language_options." + tag + ".yaml"
    File.exist?(file_path)
  end

  def default_language_tag!(tag)
    raise InvalidValueError, "tag" if !valid?(tag)
    YAMLWriter.write_data(@directory + GLOBAL_SETTINGS_FILE, "selected_language_tag", tag)
    @language.tag = tag
  end

  def all_languages
    file_path = @directory + "language_options." + default_language_tag + ".yaml"
    YAMLReader.read_data(file_path, "languages")
  end

  def language_descriptions
    options = all_languages
    languages = []
    options.each do |language|
      languages << language['description']
    end
    result = languages
  end

  def input_choices
    options = all_languages
    count = options.size
    valid_selections = [*1..count]
    valid_selections = valid_selections.map(&:to_s)
  end

  def language_tags
    options = all_languages
    tags = []
    options.each do |language|
      tags << language['tag']
    end
    result = tags
  end

  def language_tag_for_input_choice(input_choice)
    input = input_choice.to_i
    options = all_languages
    tag = options[input - 1]['tag']
  end

  def language_tag_for_description(language)
    options = all_languages
    result = options.find{|languages| languages["description"] == language}
    tag = result["tag"]
    return tag
  end
end