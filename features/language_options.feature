Feature: Display language options based on default language selected
	As a game admin
	I want to display the list of languages available in the game
	And display those languages options in the language that is selected at the time
	To improve the readability of those choices

  Scenario: Display language choices in English when selected language is English
    Given default language is "English"
    When the user is on the language configuration screen
    Then the user is displayed the language choices as "English" and "Spanish"

  Scenario: Display language choices in Spanish when selected language is Spanish
    Given default language is "Spanish"
    When the user is on the language configuration screen
    Then the user is displayed the language choices as "Inglés" and "Español"

	Scenario: Display bulleted numeric list of language options from which to choose
		Given default language is "Spanish"
		When the user is on the language configuration screen
		Then the user is displayed a numeric list of language choices

	Scenario: Update default language when a language option is selected
		Given default language is "Spanish"
		And the user is on the language configuration screen
		When the user selects "Inglés" as a language option
		Then the default language is updated to "English"
