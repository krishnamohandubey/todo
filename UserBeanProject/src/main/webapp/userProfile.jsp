<%@page import="user.User"%>
<% request.setAttribute("pageTitle", "User Profile page");%>
<%@ include file="template/header.jsp" %> 
<jsp:useBean id="userDao" class="user.UserDao" />

<div class="container">
	<span class="alert alert-success">
		<h1>Welcome UserName : <%= session.getAttribute("username")+" Email: "+ session.getAttribute("email")+", "+session.getAttribute("user_id") %>, !</h1>
	</span>
	
	<% 
	//int user_id =Integer.parseInt(session.getAttribute("user_id"));
	
	%>
	
</div>


<%@ include file="template/footer.jsp" %> 