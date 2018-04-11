Feature: Display language options based on default language selected
	As a game admin
	I want to display the list of languages available in the game
	And display those languages in the language that is selected at the time
	To improve the readability of those choices

  Scenario: Display language choices in English when selected language is English
    Given default language is "English"
    When the user is on the language configuration screen
    Then the user is displayed the language choices as "English" and "Spanish"

  Scenario: Display language choices in Spanish when selected language is Spanish
    Given default language is "Spanish"
    When the user is on the language configuration screen
    Then the user is displayed the language choices as "Inglés" and "Español"

