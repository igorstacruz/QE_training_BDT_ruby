# Author::    Marcelo Vargas  (mailto:marcelo.vargas@jalasoft.com)
# Copyright:: Copyright (c) 2017 Cucumber Class
# License::   Distributes under the same terms as Ruby

# This feature covers the validation of elements to be sure that www.google.com is working as expected

# language: es
Característica: Google Page
	This feature covers the validation of elements to be sure that www.google.com is working as expected
	
Escenario: Google Search button works as expected
	Dado I am in google main page
		Y I have filled the input 
	Cuando I press the 'Google Search' button
	Entonces I should get results

Escenario: Google Search button is enabled
	Dado I am in google main page
	Cuando I check 'Google Search' button status
	Entonces I should get it as enabled

Escenario: Google Search input is editable
	Dado I am in google main page
	Cuando I fill some text in 'Google Input' field
	Entonces I should see the text in the field

Escenario: Google Search input is editable
	Dado I am in google main page
	Cuando I fill some text in 'Google Input' field
	Entonces I should see the text in the field

Escenario: Google Search voice is working
	Dado I am in google main page
		Y I press the 'Voice Search' 
	Cuando I submit some voice message
	Entonces I should see the text in the field