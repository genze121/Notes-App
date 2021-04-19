<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_Component/allComponent.jsp"%>
<title>E-Notes App</title>

<style type="text/css">
.image-design {
	width: 100%;
	background: url("images/Home-notes.png") no-repeat center;
	background-size: 400px;
	height: 420px;
}

.text-design {
	font-family: galindo;
	text-decoration: underline;
	text-transform: uppercase;
	text-shadow: 1px 1px 2px black;
}

.button-design {
	font-family: galindo;
}
</style>
</head>
<body>
	<%@include file="all_Component/navbar.jsp"%>

	<div class="image-design"></div>
	<div class="text-design">
		<h3 class="text-center">Start taking your notes</h3>
	</div>
	<div class="text-center button-design mt-5">
		<a href="addNotes.jsp" class="btn btn-lg btn-outline-success">
			Start Here </a>
	</div>

	<%@include file="all_Component/footer.jsp"%>
</body>
</html>