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
    message = message + "\n\n"
    options = YAMLReader.read_data("language_options", "languages")
    input_choices = LanguageSetup.generate_input_choices(options)
    count = input_choices.size
    iterator = 1
    count.times do
      message = message + iterator.to_s + ". " + options[iterator-1] + "\n"
      iterator = iterator + 1
    end
     message = message + "\n"
  end
end