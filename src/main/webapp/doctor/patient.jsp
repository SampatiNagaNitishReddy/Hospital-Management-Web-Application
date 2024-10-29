 <%@page import="com.entity.Doctor" %>
 
 <%@ page import="com.entity.Appointment"%>
 <%@ page import="com.db.DBConnect"%>
 <%@ page import="com.dao.AppointmentDao"%>
 <%@ page import="java.util.List" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../Component/allcss.jsp" %>
<style type="text/css">
.point-card{
 box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}


</style>

</head>
<body>
	<%@include file="navbar.jsp"%>
		  <%Doctor doctObj = (Doctor)session.getAttribute("doctObj");%>
		<% if (doctObj == null || doctObj.toString().isEmpty()) { %>
		   response.sendRedirect("../doctor_login.jsp");
 		<%} %>
 		
 			<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
							<% if (session.getAttribute("succmsg") != null && !((String)session.getAttribute("succmsg")).isEmpty()) { %>
    						<p class="text-center text-success fs-3"><%= session.getAttribute("succmsg") %></p>
    				 		 <%session.removeAttribute("succmsg");%>
							<% } %>
					
							<% if (session.getAttribute("errormsg") != null && !((String)session.getAttribute("errormsg")).isEmpty()) { %>
    						<p class="text-center text-danger fs-3"><%= session.getAttribute("errormsg") %></p>
    				  		<%session.removeAttribute("errormsg");%>
							<% } %>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("doctObj");
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
								for (Appointment ap : list) {
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> 
										<a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-success btn-sm">Comment</a>
										 <%
										 } else {
										 %> 
										 <a href="comment.jsp?:id=<%=ap.getId()%>" class="btn btn-success btn-sm disabled">Comment</a> 
										 <%
										 }
										 %>
									</td>
								</tr>
								<%
								}
								%>



							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>
 		
 		