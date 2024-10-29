<%@page import="com.entity.User" %>

<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../Component/allcss.jsp" %>
<style type="text/css">
.point-card{
 box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}

</style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<%
    Object adminObj = session.getAttribute("adminObj"); // Assuming "adminObj" is set as a session attribute
    if (adminObj == null || adminObj.toString().isEmpty()) {
        response.sendRedirect("../admin_login.jsp"); // Replace "/your-redirect-page.jsp" with the actual URL you want to redirect to
    }
%>




<div class="container p-5">
	<p class="text-center fs-3">Admin Dashboard</p>
					<% if (session.getAttribute("succmsg") != null && !((String)session.getAttribute("succmsg")).isEmpty()) { %>
    				<p class="text-center text-success fs-3"><%= session.getAttribute("succmsg") %></p>
    				  <%session.removeAttribute("succmsg");%>
					<% } %>
					
					<% if (session.getAttribute("errormsg") != null && !((String)session.getAttribute("errormsg")).isEmpty()) { %>
    				<p class="text-center text-danger fs-3"><%= session.getAttribute("errormsg") %></p>
    				  <%session.removeAttribute("errormsg");%>
					<% } %>
					
						
				<% DoctorDao dao = new DoctorDao(DBConnect.getConn()); %>
					
					
					
					
					
					
					<div class="row">
						<div class="col-md-4">
							<div class="card-point card">
								<div class="card-body text-center text-success">
									<i class="fas fa-user-md fa-3x"></i><br>
									<p class="fs-4 text-center">
									Doctor <br> <%=dao.countDoctor()%>
									</p>
								</div>
							</div>
						</div>
						
						
			
						
						
						
						<div class="col-md-4">
							<div class="card-point card">
								<div class="card-body text-center text-success">
									<i class="fas fa-user-circle fa-3x"></i><br>
									<p class="fs-4 text-center">
									User<br> <%=dao.countUSer()%>
									</p>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="card-point card">
								<div class="card-body text-center text-success">
									<i class="far fa-calendar-check fa-3x"></i><br>
									<p class="fs-4 text-center">
									Total Appointment<br> <%=dao.countAppointment()%>
									</p>
								</div>
							</div>
						</div>
						
						<div class="col-md-4 mt-2">
							<div class="card-point card" data-bs-toggle="modal" data-bs-target="#exampleModal">
								<div class="card-body text-center text-success">
									<i class="far fa-calendar-check fa-3x"></i><br>
									<p class="fs-4 text-center">
									Specialist<br><%=dao.countSpecialist()%>
									</p>
								</div>
							</div>
						</div>
				
				</div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="../addSpecialist" method="post">
             
             <div class="form-group">
                <label>Enter specialist Name</label>
                <input type="text" name="specName" class="form-Control" />
             </div>
             <div class="text-center mt-3">
             <button type="submit" class="btn btn-primary">Add</button>
             </div>
        
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>








</body>
</html>