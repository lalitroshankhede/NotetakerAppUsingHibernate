<%@page import="com.entity.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Notes</title>
<%@include file="css_and_js.jsp"%>
</head>
<body>
<!--  Link Navbar script tag -->
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
		<h1> Update Note</h1>
		<br>
		
		<!-- To get back value from Update to Edit Page -->
		<%
		
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		FactoryProvider obj=new FactoryProvider();
		Session session4=obj.getFactory().openSession();
		 Note note=(Note)session4.get(Note.class, noteId);
		
		%>
		<form action="UpdateServlet" method="post">
		
		<input value="<%=note.getId()%>" name="noteId" type="hidden">
		
		
					<div class="form-group">
						<label for="title " class="text-light">Title</label> 
						<input type="text" class="form-control" name="title_note" id="add_title"
							aria-describedby="emailHelp" placeholder="Enter Title" required="required" value="<%=note.getTitle() %>">
                                                                                      <!-- we use note.getTitle() method to getting value form Add Note  -->               
					</div>
					<div class="form-group">
						<label for="content" class="text-light">Content</label>
						<textarea class="form-control" id="add_content" name="content_note"
							placeholder="Enter Content" style="height: 200px;" required="required" value="<%=note.getContent() %>"></textarea>
							                                              <!-- we use note.getTitle() method to getting value form Add Note  -->
					</div>
      
					<button type="submit" class="btn btn-success text-center">Save Note</button>
				</form>
		
	</div>
</body>
</html>