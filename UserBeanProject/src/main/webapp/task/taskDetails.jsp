<%@page import="java.util.Iterator"%>
<%@page import="task.Task"%>
<%@page import="java.util.List"%>
<%
request.setAttribute("pageTitle", "Task Details Page");
%>
<jsp:useBean id="taskDao" class="task.TaskDao" />
<%@ include file="../template/header.jsp"%>
<div class="header">
  <h1>Task Details</h1>
  <p>The tasks are usually displayed in order of priority or due date, with the most important or urgent tasks appearing at the top of the list. The user can typically click on a task to view more details about it or edit its properties, such as changing the due date or marking it as completed</p>
</div>
<div class="container">
	<div class="row">
		<%
		String task_id = request.getParameter("task_id");
		int taskId = Integer.parseInt(task_id);
		int userId = (Integer) session.getAttribute("user_id");

		List<Task> taskDetails = taskDao.getTaskDetails(taskId,userId);

		for (Task q : taskDetails) {
		%>
		<div class="col-sm-6">
			<div class="card card-custom">
				<div class="card-body">
					<h5 class="card-title"><%=q.getSub_task_name()%></h5>
					<div class="d-flex mb-3 fw-bold">
						<div class="p-2">Start Date : <%=q.getTask_date()%></div>
						<div class="ms-auto p-2">End Date : <%=q.getTask_end_date() %></div>
					</div>
					<div class="d-flex mb-3 fw-bold">
						<div class="p-2">Start Time : <%=q.getStart_time()%></div>
						<div class="ms-auto p-2">End Time : <%=q.getEnd_time() %></div>
					</div>
					<p class="card-text"><%=q.getTask_description()%></p>
				</div>
				<div class="card-footer">
					<div class="d-flex mb-3">
						<div class="ms-auto p-2"><i>Task Created Datetime : <%=q.getCreated_at()%></i></div>
					</div>
				</div>
			</div>

		</div>
		<%
		}
		%>

	</div>
</div>
<%@ include file="../template/footer.jsp"%>