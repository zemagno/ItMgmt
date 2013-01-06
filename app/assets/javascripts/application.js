// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
        $( "#datepicker" ).datepicker({ dateFormat: "yy-mm-dd" });
       
});


function getArrows(ev) {

  arrows=((ev.which)||(ev.keyCode));

switch(arrows) {

 case 37:
   document.getElementById('SetaEsquerda').click();
   break;

case 38:
   document.getElementById('SetaCima').click();
   break;

 case 39:
   document.getElementById('SetaDireita').click();
   break;

case 40:
   document.getElementById('SetaBaixo').click();
   break;
  }
 }
