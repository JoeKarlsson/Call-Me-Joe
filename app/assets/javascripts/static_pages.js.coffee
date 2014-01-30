# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#https://github.com/andreasstorm

$(window).scroll ->
  oVal = ($(window).scrollTop() / 240)
  $(".blur").css "opacity", oVal
