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

Task.prototype.setInformation = function() {
	console.log(this.role)
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
