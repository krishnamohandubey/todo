<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${pageTitle}</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-custom">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.jsp">JSP TODO Project</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
	        </li>
	       
	        
	        <% if(session.getAttribute("username") != null){%>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="taskDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Task</a>
	          <ul class="dropdown-menu" aria-labelledby="taskDropdown">
	          <li><a class="dropdown-item" href="task/add.jsp">Add Task</a></li>
	            <li><a class="dropdown-item" href="task/view.jsp">View Task</a></li>
	          </ul>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            <%= session.getAttribute("username")%>
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <li><a class="dropdown-item" href="userLogout.jsp">Profile</a></li>
	            <li><a class="dropdown-item" href="userLogout.jsp">Logout</a></li>
	          </ul>
	        </li>
	        <% }else{ %>
	        	
	        	<li class="nav-item">
		          <a class="nav-link" href="login.jsp">Login</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="index.jsp">Registration</a>
		        </li>
	        	
	        	
	        <% } %>
	      </ul>
	      <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="contact.jsp">Contact</a>
	        </li>
	    </div>
	  </div>
	</nav>
