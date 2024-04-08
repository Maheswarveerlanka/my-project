<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	int id=Integer.parseInt(request.getParameter("id"));
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
			String sql="update regtable set name='"+name+"',email='"+email+"',username='"+username+"',password='"+password+"',gender='"+gender+"',city='"+city+"',address='"+address+"' where id='"+id+"'";
			PreparedStatement pst=con.prepareStatement(sql);
			int i=pst.executeUpdate();
			if(i>0)
			{
				String sname="";
				String sql1="select name from regtable where id='"+id+"'";
				PreparedStatement pst1=con.prepareStatement(sql1);
				ResultSet rs=pst1.executeQuery();
				while(rs.next())
				{
					sname=rs.getString(1);
				}
				session.setAttribute("sname", sname);
				session.setAttribute("sid", id);
				response.sendRedirect("admindashboard.jsp");
			}
	}catch(Exception ex)
	{
		out.println("Exception: "+ex);
	}

%>