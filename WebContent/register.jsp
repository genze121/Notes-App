<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_Component/allComponent.jsp"%>
<title>E-Notes App</title>
<style type="text/css">
.register-design {
	font-family: galindo;
}

.text-format {
	font-family: galindo;
}

.span-format {
	font-family: galindo;
	font-size: 25px;
}

.message {
	font-family: galindo;
	font-size: 17px;
}
</style>

</head>
<body style="background: #140b76;">
	<%@include file="all_Component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-1">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-0">
					<div class="card-header">
						<div class="span-format">
							<span class="text-danger">E - </span> <span class="text-warning">N</span>
							<span class="text-info">O</span> <span class="text-primary">T</span>
							<span class="text-dark">E</span> <span class="text-success">S
								- </span> <span>Registraion</span>
						</div>
						<div class="message">
							<%
								String check = (String) session.getAttribute("checkMssg");
							String success = (String) session.getAttribute("successMssg");
							String error = (String) session.getAttribute("errorMssg");

							if (check != null) {
							%>
							<div class="alert alert-danger" role="alert">
								<%=check%>
							</div>
							<%
								session.removeAttribute("checkMssg");
							}

							if (success != null) {
							%>
							<div class="alert alert-success" role="alert">
								<%=success%><a href="login.jsp"> Login From Here...</a>
							</div>
							<%
								session.removeAttribute("successMssg");
							}

							if (error != null) {
							%>
							<div class="alert alert-danger" role="alert">
								<%=error%>
							</div>
							<%
								session.removeAttribute("errorMssg");
							}
							%>
						</div>
					</div>
					<div class="card-body">
						<form action="register" method="post">
							<div class="form-group text-format">
								<label for="exampleInputFirst1">First Name</label> <input
									type="text" class="form-control" name="first_name"
									id="exampleInputFirst1" placeholder="Enter first name" required>
							</div>
							<div class="form-group text-format">
								<label for="exampleInputLast1">Last Name</label> <input
									type="text" class="form-control" name="last_name"
									id="exampleInputFirst1" placeholder="Enter last name" required>
							</div>
							<div class="form-group text-format">
								<label for="exampleInputEmail1">Username</label> <input
									type="email" class="form-control" name="username"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter username"> <small id="emailHelp"
									class="form-text text-muted" required>We'll never share
									your email with anyone else.</small>
							</div>
							<div class="form-group text-format">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="password_"
									id="exampleInputPassword1" placeholder="Password" required>
							</div>
							<div class="form-group form-check text-format">
								<input type="checkbox" class="form-check-input" name="checkBox"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">I agree the terms and conditions</label>
							</div>
							<div class="register-design">
								<button type="submit"
									class="btn btn-lg btn-danger badge-pill btn-block">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_Component/footer.jsp"%>
</body>
</html>