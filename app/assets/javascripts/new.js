$( document ).ready(function(){
	// $("#XBL").hide();
	// $("#PSN").hide();
	// $("#Xbox_One").on("click", function(){
	// 	$("#XBL").toggle();
	// });
	// $("#Playstation_4").on("click", function(){
	// 	$("#PSN").toggle();
	// });
	// $("form").submit(function(event){
	// 	if(!atLeastOneChecked()){
	// 		event.preventDefault();
	// 		$("p").hide();
	// 		$("#create_form").before("<p style='color:red'>At least one tag must be supplied</p>");
	// 	};
	// });
});

function atLeastOneChecked(){
	if($("#XBL").val().length > 0){
		return true;
	} else if($("#PSN").val().length > 0) {	
		return true;
	} else {
		return false;
	}
};