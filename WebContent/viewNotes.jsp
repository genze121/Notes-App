<%@page import="com.ENotes.Model.NotesDAO"%>
<%@page import="com.ENotes.Bean.NotesBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_Component/allComponent.jsp"%>
<title>E-Notes App</title>

<style type="text/css">
.card-title {
	font-family: galindo;
}

.increase-size {
	font-size: 20px;
}

.button-style {
	font-family: galindo;
}

.message-alert {
	font-family: galindo;
	font-size: 17px;
}
</style>
</head>
<body>
	<%@include file="all_Component/navbar.jsp"%>

	<%
		if (user == null) {
		session.setAttribute("errorMssg", "Please login.....");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
		String success = (String) session.getAttribute("successMssg");
	String error = (String) session.getAttribute("errorMssg");

	if (success != null) {
	%>
	<div class="alert alert-success message-alert" role="alert">
		<%=success%>
	</div>
	<%
		session.removeAttribute("successMssg");
	}

	if (error != null) {
	%>
	<div class="alert alert-success message-alert" role="alert">
		<%=error%>
	</div>
	<%
		session.removeAttribute("errorMssg");
	}
	%>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-12">
				<%
					if (user != null) {
					NotesDAO notesDAO = new NotesDAO();
					List<NotesBean> lists = notesDAO.getAllNotes(user.getId());

					for (NotesBean notes : lists) {
				%>
				<div class="card mt-2">
					<img alt="small-icon" src="images/Home-notes.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px;">
					<div class="card-body">
						<h4 class="card-title">
							<b>Title:-</b>
							<%=notes.getTitle()%>
						</h4>
						<p class="card-title">
							<%=notes.getContents()%>
						</p>
						<p class="card-title">
							<b class="text-success increase-size">Published By :- </b>
							<%=user.getFirstname() + " " + user.getLastname()%>
						</p>

						<p class="card-title">
							<b class="text-danger increase-size"> Published Date :- </b>
							<%=notes.getNdate()%>
						</p>
						<div class="container text-center button-style">
							<a href="editNotes.jsp?nid=<%=notes.getId()%>"
								class="btn btn-primary">Edit</a> 
								<a href="delete?nid=<%=notes.getId()%>" class="btn btn-danger ml-2"> Delete</a>
						</div>
					</div>
				</div>

				<%
					}
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>