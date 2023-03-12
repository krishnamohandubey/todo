<% request.setAttribute("pageTitle", "Add Task Page"); %>
 
<%@ include file="../template/header.jsp" %>
<div class="header">
  <h1>Add Task</h1>
  <p>The tasks are usually displayed in order of priority or due date, with the most important or urgent tasks appearing at the top of the list. The user can typically click on a task to view more details about it or edit its properties, such as changing the due date or marking it as completed</p>
</div> 
<div class="container">
	
	<% if(request.getAttribute("alert_msg") != null){ %>
		<div class="alert alert-success alert-dismissible fade show" role="alert">
		<strong>
	<% out.println(request.getAttribute("alert_msg")); %>
		</strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	
		</div>
	<% } %>
	
	<div class="card">
	  	<div class="card-body">
			<form action="insertTask.jsp" method="post">
				<div class="row">
					<div class="mb-3">
						<div class="row">
							<input type="hidden" name="user_id" value="<%= (Integer)session.getAttribute("user_id") %>">
							<div class="col-8">
								<label class="form-label">Task Name</label>
								<input type="text" class="form-control" id="task_name" name="task_name" required="required">
								<span class="error"></span>
							</div>
							<div class="col-4">
								<button id="addRow" type="button" class="btn btn-info">Add Subtask</button>
							</div>
						</div>
					</div>
					
					 <div class="mb-3">
						 <div class="col-4 offset col-4">
						 	<div id="newRow"></div>
						 </div>
					 </div>
					
					<div class="mb-3">
						<label class="form-label">Priority</label>
						<select class="form-select" name="priority" aria-label="Please select your priority">
						  <option value="1">One</option>
						  <option value="2">Two</option>
						  <option value="3">Three</option>
						</select>	
					</div>
					<div class="mb-3">
						<label class="form-label">Start Date</label>
						<input type="text" class="form-control datepicker" id="task_date" name="task_date" required="required">
						<span class="error"></span>
					</div>
					<div class="mb-3">
						<label class="form-label">End Date</label>
						<input type="text" class="form-control datepicker" id="task_end_date" name="task_end_date" required="required">
						<span class="error"></span>
					</div>
					<div class="mb-3">
						<label class="form-label">Start Time</label>
						<input type="time" class="form-control" id="start_time" name="start_time" required="required">
						<span class="error"></span>
					</div>
					<div class="mb-3">
						<label class="form-label">End Time</label>
						<input type="time" class="form-control" id="end_time" name="end_time" required="required">
						<span class="error"></span>
					</div>
					<div class="mb-3">
						<label class="form-label">Task Description</label>
						<textarea name="task_description" class="form-control" cols="10"></textarea>
						<span class="error"></span>
					</div>
					
					<div class="mb-3">
						<input type="submit" class="btn btn-primary" id="btnSubmit" name="Add Task" value="Add Task" >
					</div>
				</div>
			</form>
		
		</div>
	</div>
</div>

<script>
	$(document).ready( function (){
		$("#addRow").click(function () {
	        var html = '';
	        html += '<div id="inputFormRow">';
	        html += '<div class="input-group mb-3">';
	        html += '<input type="text" name="sub_task_name" class="form-control m-input" placeholder="Enter Subtask" autocomplete="off">';
	        html += '<div class="input-group-append">';
	        html += '<button id="removeRow" type="button" class="btn btn-danger">Remove</button>';
	        html += '</div>';
	        html += '</div>';

	        $('#newRow').append(html);
	    });

	    // remove row
	    $(document).on('click', '#removeRow', function () {
	        $(this).closest('#inputFormRow').remove();
	    });
	    
	    
	    
	});
	
	//$(".alert").alert();
    $(".datepicker" ).datepicker();

</script>
<%@ include file="../template/footer.jsp" %> 

