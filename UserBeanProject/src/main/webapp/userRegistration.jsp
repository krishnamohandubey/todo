<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="ur" class="user.User"/>
    <jsp:setProperty property="*" name="ur"/>
    
    <jsp:useBean id="userDao" class="user.UserDao"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration submit page</title>
</head>
<body>
<%

/* if(request.getParameter("name") == null || request.getParameter("name").isEmpty()){
	request.setAttribute("name_error", "Please Enter name ");
	
}
if(request.getParameter("mobile") == null || request.getParameter("mobile").isEmpty()){
	request.setAttribute("mobile_error", "Please Mobile number");
	
}
if(request.getParameter("username") == null || request.getParameter("username").isEmpty()){
	request.setAttribute("username_error", "Please Enter UserNmae ");
	
}
if(request.getParameter("email") == null || request.getParameter("email").isEmpty()){
	request.setAttribute("email_error", "Please Enter Email");
	
}
if(request.getParameter("password") == null || request.getParameter("password").isEmpty()){
	request.setAttribute("password_error", "Please Enter Password");
	request.getRequestDispatcher("index.jsp").forward(request,response);
} */



if(userDao.insertData(ur)){
	//out.println("You have been successfully registered, Please click on link below to <a href=login.jsp>login</a>");
	request.setAttribute("alert_msg", "You have been successfully registered, Please click on link below to <a href=login.jsp>login</a>");
	request.getRequestDispatcher("welcome.jsp").include(request, response);
}else{
	request.getRequestDispatcher("index.jsp").forward(request,response);
}
%>
</body>
</html>