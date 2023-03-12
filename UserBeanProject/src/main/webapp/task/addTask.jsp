<% request.setAttribute("pageTitle", "Add Task Page"); %>
 
<%@ include file="../template/header.jsp" %> 
<div class="container">
	<h1>Add Task </h1>
	<div class="alert alert-success" role="alert">
	<% if(request.getAttribute("alert_msg") != null){
		out.println(request.getAttribute("alert_msg"));
	%>
		 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
	
	<% } %>
	</div>
	  
	
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
						<label class="form-label">Date</label>
						<input type="text" class="form-control datepicker" id="task_date" name="task_date" required="required">
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

