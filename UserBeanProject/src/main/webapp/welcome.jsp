<% request.setAttribute("pageTitle", "Registaration successfully page");%>

<%@ include file="template/header.jsp" %> 
<div class="container">
	
	<div class="alert-message">
	<%=request.getAttribute("alert_msg") %>
	</div>
	
	<h1>Welcome <%= session.getAttribute("username")+" "+ session.getAttribute("email") %>, !</h1>
	
</div>

<%@ include file="template/footer.jsp" %> 	