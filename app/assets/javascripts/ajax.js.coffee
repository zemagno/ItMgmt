# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#init_checklist_cis').autocomplete({source: "/ajax/cis", delay: 500, minLength: 3, appendTo: "#ci-droplist-container"})


$(document).ready ->
  $('#ci_Owner').autocomplete({source: "/ajax/gestores", delay: 500, minLength: 3, appendTo: "#dropbox-gestor-container"})