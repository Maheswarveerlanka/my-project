<%@page import="java.sql.ResultSet"%>
 <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String id=request.getParameter("id");
			
			//session.setAttribute("sname", null);
		%>
	
    			<%
    			
    			 String name="";
    			 String email="";
    			 String username="";
    			 String password="";
    			 String gender="";
    			 String city="";
    			 String address="";
    			 String registeras="";
    			
    			try
    			{
    				Class.forName("com.mysql.jdbc.Driver");
        			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
        			String sql="select * from regtable where id='"+id+"'";
        			PreparedStatement pst=con.prepareStatement(sql);
        			ResultSet rs=pst.executeQuery();
        			while(rs.next())
        			{
        				name=rs.getString(2);
        				email=rs.getString(3);
        				username=rs.getString(4);
        				password=rs.getString(5);
        				gender=rs.getString(6);
        				city=rs.getString(7);
        				registeras=rs.getString(8);
        				address=rs.getString(9);
        				%>
        	<div class="card-body bg-light"> 
        	  <form action="updateserver.jsp">
    			<h3>Update Detail</h3>
    			<input type="hidden" name="id" value="<%=id%>">
    				<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Name</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="name" id="name" value="<%=name%>" >
    			<small class="text-danger" id="namecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Email</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="email" id="email" value="<%=email%>" >
    			<small id="emailcheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">username</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="username" id="username" value="<%=username%>" >
    			<small id="usernamecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">password</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="password" id="password" value="<%=password%>">
    			<small id="passwordcheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">gender</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="gender" id="gender" value="<%=gender%>">
    			<small id="gendercheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">city</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="city" id="city" value="<%=city%>">
    			<small id="gendercheck"></small>
    			</div>
    	</div>
    	    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Address</label>
    			<div class="col col-sm-9">
    			<textarea rows="3" cols="3" class="form-control" name="address" ><%=address%></textarea>
    			<small id="addresscheck"></small>
    			</div>
    	</div>
    	<button type="submit" class="btn btn-primary" id="btnedit">Update</button>
    			</form>
    			
    		</div>
    		
        				<%
        			}
    			}catch(Exception ex)
    			{
    				out.println("exception "+ex);
    			}
    			
    			%>
    			
    	
   
</body>
</html>