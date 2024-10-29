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
		<div class="col-md-5 offset-md-4">
			<div class="card point-card">
				<div class="card-body">
					<p class="fs-3 text-center">Add Doctor</p>
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
				    
					
					
					<form action="../addDoctor" method="post">
						<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input type="text" required name="fullname" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">DOB</label>
							<input type="date" required name="dob" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">Qualification</label>
							<input type="text"required name="quali" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option>--select--</option>
										<%
											SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
										java.util.List<Specialist> list=dao.getAllSpecialist();
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
								<input type="text"required name="email" class="form-control">
							</div>
						<div class="mb-3">
							<label class="form-label">Mob No</label>
								<input type="text"required name="mobno" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">Password</label>
								<input type="password"required name="password" class="form-control">
						</div>
					
						<button type="submit" class="btn btn-primary">Submit</button>
					
					</form>
				</div>
			</div>
		</div>
	
	

	
	</div>
	</div>
</body>
</html>