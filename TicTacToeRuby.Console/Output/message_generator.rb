require_relative '../Input/yaml_reader.rb'

module MessageGenerator

  def self.set_localization(language)
      YAMLReader.set_localization(language)
  end

  def self.welcome
    message = YAMLReader.read_data("application_text", "welcome_message")
  end

  def self.language_configuration
    message = YAMLReader.read_data("application_text", "language_configuration")
  end

  def self.language_selection
    message = YAMLReader.read_data("application_text", "language_selection")
    options = YAMLReader.read_data("language_options", "languages")
    puts options
     
  end
end