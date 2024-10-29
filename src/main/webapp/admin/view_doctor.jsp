<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.entity.Doctor" %>
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
	<div class="Container-fluid p-3">
	<div class="row">

	
	<div class="col-md-12">
		<div class="card point-card">
			<div class="card-body">
				<p class="fs-3 text-center">Doctor Details</p>
				
								    	<%
							String errorMessage = (String) session.getAttribute("errormsg");
							if (errorMessage != null && !errorMessage.isEmpty()) {
						%>
    					<p class="fs-3 text-center text-danger"><%= errorMessage %></p>
    					<% session.removeAttribute("errormsg"); %>
						<%
						}
						%>
				    	<%
						String successMessage = (String) session.getAttribute("succmsg");
						if (successMessage!= null && !successMessage.isEmpty()) {
						%>
    					<p class="fs-3 text-center text-success"><%= successMessage %></p>
    					<% session.removeAttribute("succmsg"); %>
						<%
							}
						%>
				
				
				
				
					<table class="table">
						<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">DOB</th>
							<th scope="col">Qualification</th>
							<th scope="col">Specialist</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Action</th>
						</tr>
						</thead>
						<tbody>
						
						<%
							DoctorDao dao2=new DoctorDao(DBConnect.getConn());
						java.util.List<Doctor> list2=dao2.getAllDoctor();
						for(Doctor d: list2)
						{
						%>
						<tr>
							<td><%=d.getFullName()%></td>
							<td><%=d.getDob()%></td>
							<td><%=d.getQualification()%></td>
							<td><%=d.getSpecialist()%></td>
							<td><%=d.getEmail()%></td>
							<td><%=d.getMobNo()%></td>
							<td>
								<a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
								<a href="../deleteDoctor?id=<%=d.getId()%>"class="btn btn-sm btn-danger">Delete</a>
							</td>
							
						</tr>
				        <%} %>
						</tbody>
					</table>
			</div>
		</div>
	</div>
	
	
	</div>
	</div>
</body>
</html>