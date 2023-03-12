<%@page import="connection.CommonUtility"%>
<%@page import="user.Loginlog"%>
<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="userDao" class="user.UserDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Submit page</title>
</head>
<body>
<%

String email = request.getParameter("email");
String password = request.getParameter("password");
User ud = userDao.authenticateUser(email, password);

if(ud.getEmail() != "" && ud.getUsername() != ""){
	out.println("Successfully Login");
	session.setAttribute("user_id", ud.getId());
	session.setAttribute("username", ud.getUsername());
	session.setAttribute("email", ud.getEmail());
	
	Loginlog login_log =new Loginlog();
	login_log.setUser_id(ud.getId());
	login_log.setIp_address(request.getRemoteAddr());
	login_log.setUser_type("user");
	login_log.setLast_login(CommonUtility.getCurrentDateTime());
	login_log.setAction("login");
	
	if(userDao.InsertLoginLog(login_log)){
		out.println("  Login log added");
	}
	request.getRequestDispatcher("userProfile.jsp").include(request, response);
	
	
}


%>
</body>
</html>