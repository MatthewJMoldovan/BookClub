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
		<h1 class="navbar-brand mb-0 fs-1">Bookclub</h1>
		<div>
			<a class="btn btn-outline-primary" href="/books/new">Add a book</a> <a
				class="btn btn-outline-success" href="/dashboard">Home</a> <a
				class="btn btn-outline-danger" href="/logout">Logout</a>
		</div>
	</nav>
	<div class="w-75 p-4 mx-auto rounded border ">
		<h1> Library </h1>
				<div class="shadow mb-4 rounded border p-4 text-start text-bg-dark">
					<table class="table text-bg-dark">
						<thead>
							<tr>
								<th class="text-center">Title</th>
								<th class="text-center">Author</th>
								<th class="text-center">Posted By</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="eachBook" items="${bookList }">
								<tr>
									<td class="text-center align-middle"><a
										href="/books/${eachBook.id}" class="text-reset"><c:out
												value="${eachBook.title }"></c:out></a></td>
									<td class="text-center align-middle"><c:out
												value="${eachBook.author }"></c:out></td>
									<td class="text-center align-middle"><c:out
											value="${eachBook.postedBy.userName }"></c:out></td>
								</tr>
							</c:forEach>
					</table>
				</div>
	</div>

</body>
</html>