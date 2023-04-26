<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>All Notes</title>
<%@include file="css_and_js.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
		<br>
		<h2 class="text-uppercase">All Notes</h2>
	</div>
<div class="container">
<div class="row">
<div class="col-2"></div>
<div class="col-12">

<%
   FactoryProvider obj=new FactoryProvider();
 
Session session1=obj.getFactory().openSession();
  Query query=  session1.createQuery("from Note");
  List<Note> list=query.list();
  
  for(Note note:list)
  {
	  %>
	  
	  <!-- Note Card  -->
	  <div class="card mt-3" >
    <img class="card-img-top pt-4 ml-3" src="img/pencil.png" alt="Card image cap"  style="width: 50px">
  <div class="card-body">
    <h5 class="card-title"><%= note.getTitle() %></h5>
    <p class="card-text"><%=note.getContent() %></p>
    <div class="text-center">
     <a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
   </div>
  </div>
</div>
	  
	  
	  <% 
	   
	  
	  
	  
  }
  
  session1.close();
  
  
%>



</div>
<div class="col-2"></div>
</div>
</div>




</body>
</html>