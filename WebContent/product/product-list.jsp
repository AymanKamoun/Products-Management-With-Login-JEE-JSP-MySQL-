<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>
.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

.sticky + .content {
  padding-top: 102px;
}
</style>
<title>Products | List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<header style="height:10%" id="myHeader">
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: purple">
			<div>
				<strong style="font-weight:bold;color:white" class="navbar-brand"><span style="color:lime">P</span>roducts</strong>
			</div>

			<ul class="navbar-nav">
				<li><a style="color:white;font-weight:bold;color:white" href="<%=request.getContextPath()%>/list"
					class="nav-link">Products</a></li>
			</ul>
			
			<ul class="navbar-nav">
				<li><a style="color:white;font-weight:bold;color:white" href="<%=request.getContextPath()%>/new"
					class="nav-link">Add Products</a></li>
			</ul>
			
			<ul class="navbar-nav navbar-collapse justify-content-end">
				<li><a style="color:white;font-weight:bold;color:white" href="<%=request.getContextPath()%>/logout"
					class="nav-link">Logout</a></li>
			</ul>
		</nav>
	</header>

	<div class="row" style="width:90%;margin:auto">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Products</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new"
					class="btn btn-success">Add Product</a>
					
			</div>
			<hr>
			<div class="container text-left">
					
					<a href="<%=request.getContextPath()%>/list"
					class="btn btn-success">List Products</a>
					
			</div>
			<br>
			<table class="table table-bordered">
				<thead style="background-color: aqua">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Price($)</th>
						<th>Quantity</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Product product: products) {  -->
					<c:forEach var="product" items="${listProduct}">

						<tr>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.type}" /></td>
							<td><c:out value="${product.price}" /></td>
							<td><c:out value="${product.quantity}" /></td>
							<td><c:out value="${product.targetDate}" /></td>

							<td><a class="btn btn-success" href="edit?id=<c:out value='${product.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-success"
								href="delete?id=<c:out value='${product.id}' />">Delete</a></td>

							<!--  <td><button (click)="updateProduct(product.id)" class="btn btn-success">Update</button>
          							<button (click)="deleteProduct(product.id)" class="btn btn-warning">Delete</button></td> -->
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
	
	<script>	
window.onscroll = function() {myFunction()};

var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
</script>

</body>
</html>