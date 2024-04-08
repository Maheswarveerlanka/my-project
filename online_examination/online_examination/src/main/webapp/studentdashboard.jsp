<%@page import="java.sql.ResultSet"%>
 <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.Connection"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/362e82cc26.js" crossorigin="anonymous"></script>
    <title>Hello, world!</title>
  </head>
  <body>
    <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light " style="margin-top: 10px;border-radius:20px;background-color:rgba(123,132,23,0.5);">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
		<%
			String sname=(String)session.getAttribute("sname");
			if(sname==null)
			{
				
			}
			else
			{
				%>
					<h3>Welcome Student,<%=sname %></h3>
					
				<% 
			}
			session.setAttribute("sname", null);
		%>
		      <li class="nav-item dropdown ml-auto">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>
    <div class="row">
    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 " style="background-color: rgba(123,132,23,0.5);margin-top: 10px;border-radius: 10px;margin-left: 10px">
    		<ul class="nav flex-column " >
  <li class="nav-item">
    <a class="nav-link active" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
  </li>
  
</ul>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    	</div>
    	<div class="col col-lg-9 col-md-9 col-sm-9 col-xs-9">
    	
    			<div class="card-body bg-light">
    			<%
    			
    			 String name="";
    			 String email="";
    			 String username="";
    			 String password="";
    			 String gender="";
    			 String city="";
    			 String address="";
    			    			
    			try
    			{
    				Class.forName("com.mysql.jdbc.Driver");
        			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam","root","");
        			String sql="select * from regtable where name='"+sname+"'";
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
        				address=rs.getString(9);
        				%>
        				<section id="sectionid">
    			<form >
    				<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Name</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="fullname" id="fullname" value="<%=name%>">
    			<small class="text-danger" id="fullnamecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Email</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="email" id="email" value="<%=email%>">
    			<small id="emailcheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">username</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="username" id="username" value="<%=username%>">
    			<small id="usernamecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">password</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="passowrd" id="password" value="<%=password%>">
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
    			<textarea rows="3" cols="3" class="form-control"><%=address%></textarea>
    			<small id="addresscheck"></small>
    			</div>
    	</div>
    			</form>
    			
    			</section>
        				<%
        			}
    			}catch(Exception ex)
    			{
    				out.println("exception "+ex);
    			}
    			
    			%>
    			
    	
    	</div>
    		
    		</div>
    
    </div>
    
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>