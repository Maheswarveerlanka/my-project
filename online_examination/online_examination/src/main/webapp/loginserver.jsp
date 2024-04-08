<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String username=request.getParameter("uname");
	String password=request.getParameter("pass");
	String registeras=request.getParameter("registeras");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
			String sql="select * from regtable where (email='"+username+"'or username='"+username+"')and password='"+password+"'";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				int id=rs.getInt(1);
				String name=rs.getString(2);
				String regtype=rs.getString(8);
				if(regtype.equals("admin"))
				{
					session.setAttribute("sid",id);
					session.setAttribute("sname",name);
					response.sendRedirect("admindashboard.jsp");
				}
				else
				{
					session.setAttribute("sid",id);
					session.setAttribute("sname",name);
					response.sendRedirect("studentdashboard.jsp");
				}
				
			}
			else
			{
				session.setAttribute("slogin", "Login Failed");
				response.sendRedirect("login.jsp");
			}
		
		
	}catch(Exception ex)
	{
		out.println("Exception: "+ex);
	}
%>