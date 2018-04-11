require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'

Given("default language is {string}") do |language|
  @directory_path_for_default_language = "../TicTacToeRuby/features/test_files/"
  if language == "English"
    @directory_path_for_default_language = @directory_path_for_default_language + "default_language_english/"
  elsif language = "Spanish"
    @directory_path_for_default_language = @directory_path_for_default_language + "default_language_spanish/"
  else
    raise_error(InvalidValueError)
  end
end

When("the user is on the language configuration screen") do
  @language_adapter_with_default_language_selected = LanguageOptionsAdapter.new(@directory_path_for_default_language)
end

Then("the user is displayed the language choices as {string} and {string}") do |language1, language2|
  choices = @language_adapter_with_default_language_selected.get_language_descriptions
  expect(choices[0]).to eq(language1)
  expect(choices[1]).to eq(language2)
end