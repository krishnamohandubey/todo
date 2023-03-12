<%@page import="user.Loginlog"%>
<% request.setAttribute("pageTitle", "User Profile page");%>
<%@ include file="template/header.jsp" %> 
<jsp:useBean id="userDao" class="user.UserDao"/>
<div class="container">

<%
session.invalidate();

// Loginlog login_log =new Loginlog();
// login_log.getUser_id();



out.println("Successfully Logout");
response.sendRedirect("login.jsp");
%>
</div>

<%@ include file="template/footer.jsp" %>