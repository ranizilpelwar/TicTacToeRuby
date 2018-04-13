Feature: Configuring the game language

	Scenario: The language configuration option is displayed at the start of the game
		Given user is at the start screen
		Then user is displayed an option to configure the language

	Scenario: Display error when default language is not recognized
		Given default language setting is stored as an invalid value
		When user is at the start screen
		Then user is displayed a language configuration error message