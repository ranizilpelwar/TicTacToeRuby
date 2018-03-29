require_relative '../Output/console_writer.rb'
require_relative '../Output/message_generator.rb'
require_relative '../Input/console_reader.rb'

module LanguageSetup

  @localization = "en"

  def self.set_localization(language)
    @localization = language
  end

  def self.get_localization
    result = @localization
  end




end