<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="Component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>



</head>
<body>

	<%@include file="Component/navbar.jsp"%>
		
	 <%
  		
  		if (userObj == null) {
    	response.sendRedirect("user_login.jsp"); 
  		}
	%>


	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
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
						<form action="userChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${userObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


