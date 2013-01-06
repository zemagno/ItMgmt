
if (window.addEventListener) {
  window.addEventListener('load', initPageAtributos, false);
}
else if (window.attachEvent) {
  window.attachEvent('onload', initPageAtributos );
}



function initPageAtributos() {
  document.getElementById("ci_tipoci_id").onblur = atualizaCamposCI;
}

function atualizaCamposCI() {
    //	alert("attr");
      request = createRequest();
	  if (request == null)
		{
		//alert("Unable to create request");
		}
	  else {
	    tipoCI = document.getElementById("ci_tipoci_id").value
	
	    var url= "/tipocis/"+tipoCI+".json";
	    request.onreadystatechange = atualizaCamposCICallback;
	    request.open("GET", url, true);
	    request.send(null);
	  }
}

function atualizaCamposCICallback() {
	if (request.readyState == 4) {
    	if (request.status == 200) {
            var campos = eval("("+request.responseText+")");
			if (campos.tipoci.defCampo1 != null) {
				document.getElementById("idCampo1").innerHTML = campos.tipoci.defCampo1;
			}
			else {
				document.getElementById("idCampo1").innerHTML = "Atributo1";	
			}
			if (campos.tipoci.defCampo2 != null) {
				document.getElementById("idCampo2").innerHTML = campos.tipoci.defCampo2;
			}
			else {
				document.getElementById("idCampo2").innerHTML = "Atributo2";	
			}
			if (campos.tipoci.defCampo3 != null) {
				document.getElementById("idCampo3").innerHTML = campos.tipoci.defCampo3;
			}
			else {
				document.getElementById("idCampo3").innerHTML = "Atributo3";	
			}
			if (campos.tipoci.defCampo1 != null) {
				document.getElementById("idCampo4").innerHTML = campos.tipoci.defCampo4;
			}
			else {
				document.getElementById("idCampo4").innerHTML = "Atributo4";	
			}
			
    	}
  	}
	
}
