<%@page import="task.Task"%>
<%@page import="java.util.List"%>
<% request.setAttribute("pageTitle", "View Task Page"); %>
<jsp:useBean id="taskDao" class="task.TaskDao" /> 
<%@ include file="../template/header.jsp" %> 
<div class="container">
	<h1>View Task</h1>
	
	<table class="table">
		<thead>
			<th>Task Name</th>
			<th>Sub Task Name</th>
			<th>Date</th>
			<th>Start Time</th>
			<th>End Time</th>
			<th>Task Status</th>
		</thead>
		<tbody>
			
			
			<%
			int userId = (Integer)session.getAttribute("user_id");
			List<Task> taskData = taskDao.getTask(userId);
			for(Task task : taskData){
			%>
			<tr>
			<td><%=task.getTask_name() %></td>
			<td><%= task.getTask_name() %></td>
			<td><%= task.getTask_date() %></td>
			<td><%= task.getStart_time() %></td>
			<td><%= task.getEnd_time()%></td>
			<td><%= task.getCreated_at() %></td>
			</tr>
			<% }
			%>
			
			
			
		</tbody>
	</table>
	
</div>
<%@ include file="../template/footer.jsp" %> 