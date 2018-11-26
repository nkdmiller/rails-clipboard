
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
	function loadTasks() {
		let results = []
		$("#headers").show()
		var arr = window.location.toString().split('/')
		var project_id = arr[arr.length - 1]
		$.get( "/projects/" + project_id + ".json", function( data ) {
			data["tasks"].forEach(function(el) {
			  results.push(el)
			})
			var i = 0
			for (i = 0; i < results.length; i++){
				if (results[i]["admin"] != true){
					$("#task-table").append("<%= j render partial: 'projects/task' %>");
					console.log(results[i])
					$(".taskName").last().text(results[i]["role"])
				}
			}
		});		
	}
});

