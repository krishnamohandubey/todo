
<% request.setAttribute("pageTitle", "Add Task Page"); %>

<jsp:useBean id="tk" class="task.Task"/>
<jsp:setProperty property="*" name="tk"/>

<jsp:useBean id="taskDao" class="task.TaskDao"/>
<%@ include file="../template/header.jsp" %> 
<div class="container">
<%

tk.setSub_task_name(request.getParameterValues("sub_task_name"));

if(taskDao.save(tk)){
	request.setAttribute("alert_msg", "You have been successfully created Task");
	request.getRequestDispatcher("add.jsp").forward(request, response);
}else{
	request.setAttribute("alert_msg", "Sorry !");
	request.getRequestDispatcher("add.jsp").forward(request, response);
}


%>

</div>
<%@ include file="../template/footer.jsp" %> 