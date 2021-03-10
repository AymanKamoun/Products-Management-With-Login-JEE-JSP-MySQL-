<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Products | Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: purple">
			<div>
				<strong style="font-weight:bold;color:white" class="navbar-brand"><span style="color:lime">P</span>roducts</strong>
			</div>

			<ul class="navbar-nav">
				<li><a style="color:white;font-weight:bold;color:white" href="<%=request.getContextPath()%>/list"
					class="nav-link">Products</a></li>
			</ul>

			<ul class="navbar-nav navbar-collapse justify-content-end">
				<li><a style="color:white;font-weight:bold;color:white" href="<%=request.getContextPath()%>/logout"
					class="nav-link">Logout</a></li>
			</ul>
		</nav>
	</header>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${product != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${product == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${product != null}">
            			Edit Product
            		</c:if>
						<c:if test="${product == null}">
            			Add New Product
            		</c:if>
					</h2>
				</caption>

				<c:if test="${product != null}">
					<input type="hidden" name="id" value="<c:out value='${product.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						value="<c:out value='${product.name}' />" class="form-control"
						name="name" minlength="5" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Type</label> <select class="form-control"
						name="type" required="required">
						<option>Computer</option>
						<option>Mobile</option>
						<option>TV</option>
					</select>
				</fieldset>
				
				<fieldset class="form-group">
					<label>Price($)</label> <input type="number"
						value="<c:out value='${product.price}' />" class="form-control"
						name="price" minlength="3" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Quantity</label> <input type="number"
						value="<c:out value='${product.quantity}' />" class="form-control"
						name="quantity" minlength="3" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Date</label> <input type="date"
						value="<c:out value='${product.targetDate}' />" class="form-control"
						name="targetDate" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>