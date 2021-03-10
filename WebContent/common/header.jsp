<html>
<head>
<title>Electronic Products Management</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<header>
	<nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: purple">
			<div>
				<strong style="font-weight:bold;color:white" class="navbar-brand"><span style="color:lime">P</span>roducts</strong>
			</div>

		<ul class="navbar-nav navbar-collapse justify-content-end">
			<li><a style="font-weight:bold;color:white" href="<%= request.getContextPath() %>/login" class="nav-link">Login</a></li>
			<li><a style="font-weight:bold;color:white" href="<%= request.getContextPath() %>/register" class="nav-link">Signup</a></li>
		</ul>
	</nav>
</header>