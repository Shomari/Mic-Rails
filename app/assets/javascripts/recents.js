$( document ).ready(function(){
	$(".session_button").on("click", function(event){
		box = this.closest(".session_box")
		var name = $(box).find("#player_name").text();
		var data = $(this).closest(".new_recently_added").serialize();
		event.preventDefault();
		$.ajax({
		  type: "POST",
		  url:  $('.new_recently_added').attr('action'),
		  data: data,
		  success: function(){
		  	$("#notification").empty()				
		  	$("#notification").append(name+' Player Added');
		  }
		  // dataType: dataType
		});
	})
});