<%@ page import="java.util.List" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DBConnect" %>
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
          <%Doctor doctObj = (Doctor)session.getAttribute("doctObj");%>
		<% if (doctObj == null || doctObj.toString().isEmpty()) { %>
		 <%   response.sendRedirect("../doctor_login.jsp");%>
 		<% } %>
	<%@include file="navbar.jsp"%>
	
		<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card point-card">
					<p class="text-center fs-3">Change Password</p>
					
					<% if (session.getAttribute("succmsg") != null && !((String)session.getAttribute("succmsg")).isEmpty()) { %>
    				<p class="text-center text-success fs-3"><%= session.getAttribute("succmsg") %></p>
    				  <%session.removeAttribute("succmsg");%>
					<% } %>
					
					<% if (session.getAttribute("errormsg") != null && !((String)session.getAttribute("errormsg")).isEmpty()) { %>
    				<p class="text-center text-danger fs-3"><%= session.getAttribute("errormsg") %></p>
    				  <%session.removeAttribute("errormsg");%>
					<% } %>

				
				
				
				
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-5 offset-md-2">
			<div class="card point-card">
			<p class="text-center fs-3">Edit Profile</p>
			
					<% if (session.getAttribute("succMsgd") != null && !((String)session.getAttribute("succMsgd")).isEmpty()) { %>
    				<p class="text-center text-success fs-3"><%= session.getAttribute("succMsgd") %></p>
    				  <%session.removeAttribute("succMsgd");%>
					<% } %>
					
					<% if (session.getAttribute("errorMsgd") != null && !((String)session.getAttribute("errorMsgd")).isEmpty()) { %>
    				<p class="text-center text-danger fs-3"><%= session.getAttribute("errorMsgd") %></p>
    				  <%session.removeAttribute("errormMsgd");%>
					<% } %>
			
			<div class="card-body">
			
			<form action="../doctorUpdateProfile" method="post">
						<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input type="text" required name="fullname" class="form-control" value="${doctObj.fullName}">
						</div>
						<div class="mb-3">
							<label class="form-label">DOB</label>
							<input type="date" required name="dob" class="form-control" value="${doctObj.dob}">
						</div>
						<div class="mb-3">
							<label class="form-label">Qualification</label>
							<input type="text"required name="quali" class="form-control" value="${doctObj.qualification}">
						</div>
						<div class="mb-3">
							<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option>${doctObj.specialist}</option>
										<%
											SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
										    List<Specialist> list=dao.getAllSpecialist();
											for(Specialist s:list){
										%>
											<option><%=s.getSpecialistName()%></option>
										<% 	
											}
										%>
									
								
								</select>
						</div>
						<div class="mb-3">
							<label class="form-label">Email</label>
								<input type="text" readonly required name="email" class="form-control"value="${doctObj.email}">
							</div>
						<div class="mb-3">
							<label class="form-label">Mob No</label>
								<input type="text"required name="mobno" class="form-control" value="${doctObj.mobNo}">
						</div>
					
							<input type="hidden" name="id" value="${doctObj.id }">

							<button type="submit" class="btn btn-primary">Update</button>
					
					</form>
			
			
			
			</div>
			</div>
			</div>
			
			
		</div>
	</div>
	

</body>
</html>