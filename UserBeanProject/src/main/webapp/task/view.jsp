<%@page import="task.Task"%>
<%@page import="java.util.List"%>
<%
request.setAttribute("pageTitle", "View Task Page");
%>
<jsp:useBean id="taskDao" class="task.TaskDao" />
<%@ include file="../template/header.jsp"%>
<div class="header">
  <h1>Task View</h1>
  <p>The tasks are usually displayed in order of priority or due date, with the most important or urgent tasks appearing at the top of the list. The user can typically click on a task to view more details about it or edit its properties, such as changing the due date or marking it as completed</p>
</div>
<%
String start_date=request.getParameter("start_date");

String end_date=request.getParameter("end_date");
%>
<div class="row search-bar">
	<form action="view.jsp" method="POST" class="form-inline">
		<div class="form-group custom-form-group">
		    <input type="text" class="form-control datepicker" id="start_date" class="" name="start_date" placeholder="Start date" value="<%=start_date%>">
	    </div>
	    <div class="form-group custom-form-group">
		    <input type="text" class="form-control datepicker" id="end_date" name="end_date" placeholder="End date" value="<%=end_date%>">
	    </div>
	    <button type="submit" class="btn btn-primary">Search</button>
	</form>
</div>
<div class="container">
	
	<div class="row">
			<%
			
			int userId = (Integer) session.getAttribute("user_id");
			List<Task> taskData = taskDao.getTaskByUserId(userId, start_date, end_date);
			if(!taskData.isEmpty()){
			for (Task q : taskData) {
			%>
		<div class="col-sm-6">
			<div class="card card-custom">
				<div class="card-body">
					<div class="d-flex">
						<div class="p-2"><h3 class="card-title"><%=q.getTask_name()%></h3></div>
						<div class="ms-auto p-2">
							<button class="btn btn-danger" onclick="deleteTask(<%= q.getId() %>)">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
								  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							</button>
							<button class="btn btn-success" onclick="completeTask(<%= q.getId() %>)">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
								</svg>
							</button>
						</div>
					</div>
					
					<div class="d-flex fw-bold">
						<div class="p-2">Start Date : <%=q.getTask_date()%></div>
						<div class="ms-auto p-2">End Date : <%=q.getTask_end_date() %></div>
					</div>
					<div class="d-flex fw-bold">
						<div class="p-2">Start Time : <%=q.getStart_time()%></div>
						<div class="ms-auto p-2">End Time : <%=q.getEnd_time() %></div>
					</div>
					<p class="card-text"><%=q.getTask_description()%></p>
					<a href="taskDetails.jsp?task_id=<%=q.getId()%>" class="btn btn-primary">Explore More Details</a>
				</div>
				<div class="card-footer">
					<div class="d-flex mb-3">
						<div class="ms-auto p-2"><i>Task Created DateTime : <%=q.getCreated_at()%></i></div>
					</div>
				</div>
			</div>
			
		</div>
		<%
			}
			}else{
		%>
		<div class="row">
			<div class="alert alert-warning" role="alert">
			  No Data Found
			</div>
		</div>
		<% 	
			}
			%>
		
	</div>

</div>

<script>
	function deleteTask(task_id){
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
				  
				  $.ajax({
	                    type: "GET",
	                    url: "deleteTask",
	                    data: {id:task_id},
	                    dataType: "json", 
	                    timeout: 30000,
	                    success: function(data) 
	                    {
	                        console.log(data);
	                        if(data){
	                            swal({
	                              title:"Deleted!",
	                              text:'Task deleted',
	                              type:'success',
	                              timer:10000
	                            });
	                        }
	                    },
	                    error: function(xhr) {
	                        console.log(xhr.statusText);
	                    }
	                });
				
			  }
			})
	}
	
	function completeTask(taskId){
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
				  
				  $.ajax({
	                    type: "GET",
	                    url: "completeTask",
	                    data: {id:taskId},
	                    dataType: "json", 
	                    timeout: 30000,
	                    success: function(data) 
	                    {
	                        console.log(data);
	                        if(data){
	                            swal({
	                              title:"Completed!",
	                              text:'Task completed',
	                              type:'success',
	                              timer:10000
	                            }); 
	                        }
	                    },
	                    error: function(xhr) {
	                        console.log(xhr.statusText);
	                    }
	                });
				
			  }
			})
	}
	
	
	$(".datepicker" ).datepicker();
</script>
<%@ include file="../template/footer.jsp"%>
