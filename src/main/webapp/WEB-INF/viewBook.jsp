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
		<h1 class="navbar-brand mb-0 fs-1">${oneBook.title }</h1>
		<div>
			<a class="btn btn-outline-primary" href="/books/new">Add a book</a> <a
				class="btn btn-outline-success" href="/dashboard">Home</a> <a
				class="btn btn-outline-danger" href="/logout">Logout</a>
		</div>
	</nav>
	<div class="w-75 p-4 mx-auto mt-5 rounded border text-bg-dark">
		<h3 class="text-decoration-underline">Book details</h3>
		<h4><c:out value="Title: ${oneBook.title }" /></h4>
		<h4><c:out value="Author: ${oneBook.author }" /></h4>
		<c:choose>
			<c:when test="${userId == oneBook.postedBy.id}">
				<h4>Shared by: you</h4>
			</c:when>
			<c:otherwise>
				<h4><c:out value="Shared by: ${oneBook.postedBy.userName }"/></h4>
			</c:otherwise>
		</c:choose>
			<c:choose>
				<c:when test="${userId == oneBook.postedBy.id}">
					<h4>Here are your thoughts:</h4>
				</c:when>
				<c:otherwise>
					<h4>
						<c:out value=" here are ${oneBook.postedBy.userName }'s thoughts:" />
					</h4>
				</c:otherwise>
			</c:choose>
		<div class="rounded border p-2 mb-2">
			<p>
				<c:out value="${oneBook.thoughts }" />
			</p>
		</div>
		<div class="d-flex">
			<c:if test="${userId == oneBook.postedBy.id}">
				<a href="edit/${oneBook.id}" class="btn btn-success me-3">Edit</a>
				<form action="/books/${oneBook.id }" method="POST">
					<input type="hidden" name="_method" value="delete">
					<button class="btn btn-danger" type="submit">Delete</button>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>