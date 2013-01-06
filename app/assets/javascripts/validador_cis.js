
if (window.addEventListener) {
  window.addEventListener('load', initPageCI, false);
}
else if (window.attachEvent) {
  window.attachEvent('onload', initPageCI );
}


function initPageCI() {
  
  document.getElementById("chave_ci").onblur = verificaChave;
  document.getElementById("chave_ci").focus();

}


function verificaChave() {

  document.getElementById("chave_ci").className = "thinking";

  request = createRequest();
  if (request == null)
    {
	   //alert("Unable to create request")';
	}
  else {
    var theName = document.getElementById("chave_ci").value;
    var chave = escape(theName);

    var url= "/cis/checkChave.json?search=" + chave;
    request.onreadystatechange = verificaChaveCallback;
    request.open("GET", url, true);
    request.send(null);
  }
}

function verificaChaveCallback() {
  if (request.readyState == 4) {
    if (request.status == 200) {
      if (request.responseText == "inexistente") {
        document.getElementById("chave_ci").className = "approved";
        //document.getElementById("SalvarCI").disabled = false;
      } else {
	    //alert("ops.")
        document.getElementById("chave_ci").className = "denied";
        document.getElementById("chave_ci").focus();
        document.getElementById("chave_ci").select();
        //document.getElementById("SalvarCI").disabled = true;
      }
    }
  }
}