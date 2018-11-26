
$(document).ready(function(){
	$( "#ne" ).click(function() {
  		$("#test").text("hii");
	});

	$("#load-tasks").click(function(){
		let project_id = window.location.toString().split('/');
		$("#loc").text(x[x.length - 1])
 		$.get("/products/" + project_id + ".json", function(data) {
 			#rewrite task form to hide table headers and iterate through json for each task. Unhide after button click and send ajax request. 
	})
});

