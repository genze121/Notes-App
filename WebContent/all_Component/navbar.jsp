<%@page import="com.ENotes.Bean.UserBean"%>
<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="allComponent.jsp"%>
<title>E-Notes App</title>
<style type="text/css">
.button-design {
	font-family: galindo;
}

.text-design-format {
	font-family: galindo;
	font-size: 20px;
	text-shadow: 1px 1px 2px black;
	text-transform: uppercase;
}

.modal-title {
	font-family: galindo;
	font-size: 20px;
	text-shadow: 1px 1px 2px black;
	text-transform: uppercase;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="index.jsp"><i class='fa fa-book'></i>
			E-Notes App</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">
						<i class='fa fa-home'></i> Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="addNotes.jsp"><i class='fa fa-plus-square-o'></i> Add
						Notes</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="viewNotes.jsp"><i class='fa fa-eye'></i> View Notes</a></li>

			</ul>
			<%
				UserBean user = (UserBean) session.getAttribute("user");
			if (user == null) {
			%>
			<form class="form-inline my-2 my-lg-0">
				<a href="login.jsp" class="btn btn-success btn-lg button-design"><i
					class='fa fa-user-circle-o'></i> Login</a> <a href="register.jsp"
					class="btn btn-danger btn-lg ml-2 button-design"><i
					class='fa fa-user-plus'></i> Register</a>
			</form>
			<%
				} else {
			%>
			<form class="form-inline my-2 my-lg-0">
				<a class="btn btn-success btn-lg text-light button-design"
					data-toggle="modal" data-target="#exampleModalCenter"><i
					class='fa fa-user-secret'></i> <%=user.getFirstname() + " " + user.getLastname()%></a>
				<a class="btn btn-danger text-light btn-lg button-design ml-2"
					data-toggle="modal" data-target="#exampleModal"><i
					class='fa fa-power-off'></i> Logout </a>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">
									User Profile :-
									<%=user.getFirstname() + " " + user.getLastname()%></h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="text-center">
									<i class='fa fa-user fa-4x'></i>
								</div>
								<div>
									<table class="table text-center">
										<tr>
											<th>User ID</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th>First Name</th>
											<td><%=user.getFirstname()%></td>
										</tr>

										<tr>
											<th>Last Name</th>
											<td><%=user.getLastname()%></td>
										</tr>

										<tr>
											<th>Username</th>
											<td><%=user.getUsername()%></td>
										</tr>

									</table>
									<div class="text-center">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
							<div class="modal-footer"></div>
						</div>
					</div>
				</div>

			</form>
			<%
				}
			%>

		</div>

		<!-- Logout Popup -->
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Logout Modal</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-design-format">
							<h3 class="text-center">Do you want to logout?</h3>
						</div>
						<div class="text-center mt-4">
							<button type="button" class="btn btn-lg btn-info"
								data-dismiss="modal">Close</button>
							<a href="logout" type="button" class="btn btn-lg btn-danger">Logout</a>
						</div>

					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>