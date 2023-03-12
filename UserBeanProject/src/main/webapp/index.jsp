<% request.setAttribute("pageTitle", "User Registaration page"); %>
 
<%@ include file="template/header.jsp" %> 
<div class="header">
  <h1>Home Page</h1>
  <p>The tasks are usually displayed in order of priority or due date, with the most important or urgent tasks appearing at the top of the list. The user can typically click on a task to view more details about it or edit its properties, such as changing the due date or marking it as completed</p>
</div>
<div class="container">
	<div class="card">
	  	<div class="card-body">
			<form action="userRegistration.jsp" method="post">
				<div class="row">
					<div class="mb-3">
						<label class="form-label">Name</label>
						<input type="text" class="form-control" id="name" name="name" required="required">
						<span class="error"><% request.getAttribute("name_error"); %></span>
					</div>
					<div class="mb-3">
						<label class="form-label">Mobile</label>
						<input type="text" class="form-control" id="mobile" name="mobile" required="required">
						<span class="error"><% request.getAttribute("mobile_error"); %></span>
					</div>
					
					<div class="mb-3">
						<label class="form-label">Username</label>
						<input type="text" class="form-control" id="Username" name="username" required="required">
						<span class="error"><% request.getAttribute("username_error"); %></span>
					</div>
					<div class="mb-3">
						<label class="form-label">Email</label>
						<input type="email" class="form-control" id="email" name="email" required="required">
						<span class="error"><% request.getAttribute("email_error"); %></span>
					</div>
					<div class="mb-3">
						<label class="form-label">Password</label>
						<input type="password" class="form-control" id="password" name="password" required="required">
						<span class="error"><% request.getAttribute("password_error"); %></span>
					</div>
					<div class="mb-3">
						<input type="submit" class="btn btn-primary" id="btnSubmit" name="submit" value="Submit" >
					</div>
				</div>
			</form>
		
		</div>
	</div>
</div>
		
<%@ include file="template/footer.jsp" %> 