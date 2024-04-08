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
		System.out.println(id);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
		String sql="delete from coursetable where id='"+id+"'";
			PreparedStatement pst=con.prepareStatement(sql);
			int i=pst.executeUpdate();
			response.sendRedirect("showcoursetable.jsp");
	}catch(Exception ex)
	{
		out.println("Exception: "+ex);
	}
%>
</body>
</html>