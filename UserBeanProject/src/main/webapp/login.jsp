<%request.setAttribute("pageTitle", "User Login Page");%>
<%@ include file="template/header.jsp" %> 
<div class="container">
	<h1>Login Page </h1>
	<div class="card">
	  	<div class="card-body">
			<form action="UserLogin.jsp" method="post">
				<div class="row">
					<div class="mb-3">
						<label class="form-label">Email</label>
						<input type="email" class="form-control" id="email" name="email" required="required">
					</div>
					<div class="mb-3">
						<label class="form-label">Password</label>
						<input type="password" class="form-control" id="password" name="password" required="required">
					</div>
					<div class="mb-3">
						<input type="submit" class="btn btn-primary" id="btnSubmit" name="submit" value="Login" >
					</div>
				</div>
			</form>
		
		</div>
	</div>
</div>
<%@ include file="template/footer.jsp" %> 