<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String gender=request.getParameter("gender");
	String city=request.getParameter("city");
	String address=request.getParameter("address");
	String registertype="student";



	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
			String sql="insert into regtable(name,email,username,password,gender,city,registertype,address)values('"+name+"','"+email+"','"+username+"','"+password+"','"+gender+"','"+city+"','"+registertype+"','"+address+"')";
			PreparedStatement pst=con.prepareStatement(sql);
			int i=pst.executeUpdate();
			if(i>0)
			{
				session.setAttribute("sreg","Registerd Successfully");
				response.sendRedirect("login.jsp");
			}
	}catch(Exception ex)
	{
		out.println("Exception: "+ex);
	}

%>