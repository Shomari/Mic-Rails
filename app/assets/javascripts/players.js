$( document ).ready(function(){
	$("#console_XB1").prop("checked", true);
	$("#psgames").hide();
	$("#session_form").on("click", function(){
		if($("#console_XB1").is(':checked')) {			
			$("#psgames").hide();
			$("#psgames").val("");
			$("#xbgames").show();
	}
		if($("#console_PS4").is(':checked')) {				
			$("#xbgames").hide();
			$("#xbgames").val("");
			$("#psgames").show();
	}


	});

});