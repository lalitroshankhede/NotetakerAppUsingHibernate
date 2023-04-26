<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@include file="css_and_js.jsp"%>
<title>Add Notes</title>
</head>
<body>

	<!--  Link Navbar script tag -->
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
	</div>


	<h1>This is Add Notes Page</h1>

	<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>

			<div class="col-sm-4">
				<form action="SaveNoteServlet" method="post">
					<div class="form-group">
						<label for="title " class="text-light">Title</label> 
						<input type="text" class="form-control" name="title_note" id="add_title"
							aria-describedby="emailHelp" placeholder="Enter Title" required="required">

					</div>
					<div class="form-group">
						<label for="content" class="text-light">Content</label>
						<textarea class="form-control" id="add_content" name="content_note"
							placeholder="Enter Content" style="height: 200px;" required="required"></textarea>
					</div>

					<button type="submit" class="btn btn-primary">Add</button>
				</form>
			</div>
		</div>
	</div>
	<!--  Adding Note -->

	<div class="col-sm-4"></div>
</body>
</html>