<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_Component/allComponent.jsp"%>
<title>E-Notes App</title>

<style type="text/css">
.login-design {
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
<body style="background: #02f5b6;">
	<%@include file="all_Component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-1">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header">
						<div class="span-format">
							<span class="text-danger">E - </span> <span class="text-warning">N</span>
							<span class="text-info">O</span> <span class="text-primary">T</span>
							<span class="text-dark">E</span> <span class="text-success">S
								- </span> <span>Login</span>
						</div>
						<div class="message">
							<%
								String error = (String) session.getAttribute("errorMssg");
							if (error != null) {
							%>
							<div class="alert alert-danger" role="alert">
								<%=error%>
							</div>
							<%
								}
							session.removeAttribute("errorMssg");
							%>

							<%
								String logout = (String) session.getAttribute("logoutMssg");
							if (logout != null) {
							%>
							<div class="alert alert-danger" role="alert">
								<%=logout%>
							</div>
							<%
								session.removeAttribute("logoutMssg");
							}
							%>
						</div>
					</div>
					<div class="card-body">
						<form action="login" method="post">

							<div class="form-group text-format">
								<label for="exampleInputEmail1">Username</label> <input
									type="email" class="form-control" name="username"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter username"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group text-format">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="password_"
									id="exampleInputPassword1" placeholder="Password" required>
							</div>
							<div class="login-design mt-4">
								<button type="submit"
									class="btn btn-lg btn-success badge-pill btn-block">Login</button>
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