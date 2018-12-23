let current_id

$.get("/users/getcurrentuser", function( data ) {
	current_id = data["id"]	
	$(".loads-current-user").show()
})

function Task(filled, admin, username, user_id, role, project_id, id){
	this.filled = filled;
	this.admin = admin;
	this.username = username;
	this.user_id = user_id;
	this.role = role;
	this.project_id = project_id
	this.id = id
}

Task.prototype.setInformation = function(i="") {
	console.log()
	$(".taskName").last().text(this.role)
   	if (this.filled === true && this.user_id != current_id){
		$(".creator").last().text(this.username)
		$(".actionButton").last().text("N/A")   		
   	}
   	else if (this.filled === true && this.user_id == current_id){
		$(".creator").last().text("You!")
		$(".actionButton").last().append("<h3><a href='/projects/"+this.project_id+"/tasks/" +this.id+ "/edit'><button class='button-red'>Drop Task</button></h3>")
   	}
   	else {
		$(".creator").last().text("Empty!")
		$(".actionButton").last().append("<h3><a href='/projects/"+this.project_id+"/tasks/" +this.id+ "/edit'><button class='button-green'>Pick Up Task</button></h3>")  		
   	}
};

Task.prototype.setInformationForWelcome = function(i,column) {
	var row = ".task-table"+ i;
	console.log(this)
	console.log(row+".taskName"+column)
	$(row+".taskName"+column).text(this.role)
   	if (this.filled === true && this.user_id != current_id){
		$(row+".creator"+column).text(this.username)
		$(row+".actionButton"+column).text("N/A")   		
   	}
   	else if (this.filled === true && this.user_id == current_id){
		$(row+".creator"+column).text("You!")
		$(row+".actionButton"+column).append("<h3><a href='/projects/"+this.project_id+"/tasks/" +this.id+ "/edit'><button class='button-red'>Drop Task</button></h3>")
   	}
   	else {
		$(row+".creator"+column).text("Empty!")
		$(row+".actionButton"+column).append("<h3><a href='/projects/"+this.project_id+"/tasks/" +this.id+ "/edit'><button class='button-green'>Pick Up Task</button></h3>")  		
   	}
};
function Project(name, created_at, id){
	this.name = name;
	this.created_at = created_at;
	this.id = id
}
Project.prototype.listParticipants = function () {
	
}