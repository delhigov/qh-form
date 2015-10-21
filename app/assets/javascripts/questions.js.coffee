# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	addButton = $('#add')
	addButton.click () ->
		  addButton.html('<%= f.input :text, label: \'Question\', placeholder: \'What is your question?\', :input_html => {:rows => 5}%>')