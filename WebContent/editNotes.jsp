<%@page import="com.ENotes.Bean.NotesBean"%>
<%@page import="com.ENotes.Model.NotesDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_Component/allComponent.jsp"%>
<title>E-Notes App</title>

<style type="text/css">
.text-format-2 {
	font-family: galindo;
	font-size: 20px;
}

.button-add {
	font-family: galindo;
}

.head-design {
	font-family: galindo;
	font-size: 30px;
	text-shadow: 1px 1px 1px black;
}

.alert-message {
	font-family: galindo;
	font-size: 16px;
}
</style>
</head>
<body>
	<%@include file="all_Component/navbar.jsp"%>
	<%
		if (user == null) {
		session.setAttribute("errorMssg", "Please login....");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-12">

				<form action="editNotes" method="post">

					<div class="head-design mt-2">
						<h2 class="text-center">
							<i class='fa fa-edit'></i> Edit Notes Here
						</h2>
					</div>
					<%
					int noteid = Integer.parseInt(request.getParameter("noteId"));
					NotesDAO notesDAO = new NotesDAO();
					NotesBean notes = notesDAO.getNotesById(noteid);
					%>

					<%
						if (user != null) {
					%>
					<input type="hidden" value="<%=user.getId()%>" name="userId">
					<%
						}
					%>

					<%
						if (notes != null) {
					%>
					<input type="hidden" value="<%=notes.getId()%>" name="noteId">
					<%
						}
					%>

					<div class="form-group text-format-2 mt-2">
						<label for="exampleInputTitle1">Notes Title</label> <input
							type="text" class="form-control" name="title"
							value="<%=notes.getTitle()%>" id="exampleInputTitle1"
							placeholder="Enter title">
					</div>

					<div class="form-group text-format-2">
						<label for="exampleFormControlTextarea1">Notes Content</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							name="contents" placeholder="Content goes here...." rows="12"><%=notes.getContents()%></textarea>
					</div>
					<div class="text-center button-add">
						<button type="submit" class="btn btn-lg btn-primary">Edit
							Notes</button>
					</div>
				</form>


			</div>
		</div>
	</div>
	<%@include file="all_Component/footer.jsp"%>
</body>
</html>