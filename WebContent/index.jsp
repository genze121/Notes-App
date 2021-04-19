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
	margin: 0;
	padding: 0; width : 100%;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
	width: 100%; background-repeat : no-repeat; background-size : cover;
	background-attachment : fixed;
	height: 75vh;
}

.text-design {
	font-family: galindo;
	font-size: 45px;
	text-shadow: 1px 1px 3px black;
}
</style>
</head>
<body>
	<%@include file="all_Component/navbar.jsp"%>
	<div class="text-center mt-3">
		<h2 class="text-design">
			<i class='fa fa-meetup'></i> Welcome to E-Notes App
		</h2>
	</div>
	<div class="container-fluid">
		<img alt="home" class="image-design" src="images/Home.jpg">
	</div>

	<%@include file="all_Component/footer.jsp"%>
</body>
</html>