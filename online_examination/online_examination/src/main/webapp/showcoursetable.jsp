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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h3>All Courses</h3>
					<table class="table">
					<tr><th>Sr.No</th>
						<th>Course Name</th>
						<th>Total Mark</th>
						<th>Exam Time</th>
						<th>Action</th>
						
					</tr>
<%
	int j=1;
	int id1;
	String coursename;
	String totalmark;
	String examtime;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam", "root", "");
			String sql1="select * from coursetable";
			PreparedStatement pst1=con.prepareStatement(sql1);
			ResultSet rs=pst1.executeQuery();
			while(rs.next())
			{
				
				id1=rs.getInt(1);
				coursename=rs.getString(2);
				totalmark=rs.getString(3);
				examtime=rs.getString(4);
				%>
					
					<tr>
						<td><%=j++ %></td>
						<td><%=coursename %></td>
						<td><%=totalmark %></td>
					    <td><%=examtime %></td>
					    <td><button class="del" data-did="<%=id1%>"><i class="fa-solid fa-trash"></i></button></td>
					</tr>
					
					
				<%
			}
		
	}catch(Exception ex)
	{
		System.out.println("Exception: "+ex);
	}
%>
</table>
<script>
	$(document).ready(function(){
		$(".del").click(function() {
			var id=$(this).data("did");
			
			$.get("deletecourseserver.jsp",{id:id},function(data,status){
					$("#showcourse").html(data);
				});
		});
	});

</script>
</body>
</html>