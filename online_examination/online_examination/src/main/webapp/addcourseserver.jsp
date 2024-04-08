<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	int j=1;
	int id1;
	String coursename;
	String totalmark;
	String examtime;
	String cname=request.getParameter("cname");
	String tmark=request.getParameter("tmark");
	String etime=request.getParameter("etime");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam", "root", "");
		String sql="insert into coursetable (coursename,totalmark,examtime)values('"+cname+"','"+tmark+"','"+etime+"')";
		PreparedStatement pst=con.prepareStatement(sql);
		int i=pst.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("showcoursetable.jsp");
		}
	}catch(Exception ex)
	{
		System.out.println("Exception: "+ex);
	}
%>
