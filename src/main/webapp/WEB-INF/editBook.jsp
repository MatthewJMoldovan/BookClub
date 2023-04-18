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
		<h1 class="navbar-brand mb-0 fs-1"><c:out value="${oneBook.title }"/></h1>
		<div>
			<a class="btn btn-outline-primary" href="/books/new">Add a book</a> <a
				class="btn btn-outline-success" href="/dashboard">Home</a> <a
				class="btn btn-outline-danger" href="/logout">Logout</a>
		</div>
	</nav>
		<div class="w-75 p-4 mx-auto rounded border text-bg-dark">
		<div class="shadow mb-4 rounded border p-4 text-start">
		<h3><c:out value="Edit ${oneBook.title}"/></h3>
			<form:form action="/process/edit/${oneBook.id }" method="PUT"
				modelAttribute="oneBook">
				<div class="formGroup">
					<div>
						<form:label path="title"> Title</form:label>
						<form:input class="form-control" type="text" path="title" />
						<form:errors path="title" />
					</div>
					<div>
						<form:label path="author"> Author</form:label>
						<form:input class="form-control" type="text" path="author" />
						<form:errors path="author" />
					</div>
					<div>
						<form:label path="thoughts"> Thoughts</form:label>
						<form:textarea class="form-control" type="text" path="thoughts" />
						<form:errors path="thoughts" />
					</div>
					<div>
						<form:hidden path="postedBy"></form:hidden>
					</div>
					<button class="mt-2 btn btn-primary" type="submit">Submit</button>
				</div>
			</form:form>
		</div>
	</div>
	
</body>
</html>