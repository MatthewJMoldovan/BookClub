<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Book Club</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light sticky-top justify-content-between m-2 mb-2 px-4 rounded border">
		<h1 class="navbar-brand mb-0 fs-1">Book Club</h1>
	</nav>
	<div class="container mt-5">

		<div class="row">
			<div class="p-2 col me-5">
				<h1 class="text-center">Register a user!</h1>
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div>
						<div>
							<form:label path="userName"> User Name</form:label>
							<form:input class="form-control" type="text" path="userName" />
							<form:errors path="userName" />
						</div>
						<div>
							<form:label path="email"> Email</form:label>
							<form:input class="form-control" type="text" path="email" />
							<form:errors path="email" />
						</div>
						<div>
							<form:label path="password"> Password</form:label>
							<form:input class="form-control" type="password" path="password" />
							<form:errors path="password" />
						</div>
						<div>
							<form:label path="confirm"> Confirm Password</form:label>
							<form:input class="form-control" type="password" path="confirm" />
							<form:errors path="confirm" />
						</div>
						<button class="mt-2 btn btn-primary" type="submit">Submit</button>
					</div>
				</form:form>
			</div>
			<div class="p-2 col ms-5">
				<h1 class="text-center">Login!</h1>
				<form:form action="/login" method="POST" modelAttribute="newLogin">
					<div>
						<div>
							<form:label path="email"> Email</form:label>
							<form:input class="form-control" type="text" path="email" />
							<form:errors path="email" />
						</div>
						<div>
							<form:label path="password"> Password</form:label>
							<form:input class="form-control" type="password" path="password" />
							<form:errors path="password" />
						</div>
						<button class="mt-2 btn btn-primary" type="submit">Submit</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>