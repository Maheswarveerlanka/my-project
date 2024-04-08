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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Hello, world!</title>
  </head>
  <body style="background-color: rgba(50,70,160,0.5);">
  
  		<script >
  			$(document).ready(function() {
				$("#profilesection").show();
				$("#coursesection").hide();
				$("#quetionsection").hide();
				$("#accountsection").hide();
				$("#profileid").click(function() {
					$("#profilesection").show();
					$("#coursesection").hide();
					$("#quetionsection").hide();
					$("#accountsection").hide();
				});
				$("#courseid").click(function() {
					$("#profilesection").hide();
					$("#coursesection").show();
					$("#quetionsection").hide();
					$("#accountsection").hide();
				});
				$("#quetionid").click(function() {
					$("#profilesection").hide();
					$("#coursesection").hide();
					$("#quetionsection").show();
					$("#accountsection").hide();
				});
				$("#accountid").click(function() {
					$("#profilesection").hide();
					$("#coursesection").hide();
					$("#quetionsection").hide();
					$("#accountsection").show();
				});

			});
  		</script>
  
    <div class="container-fluid">
    <nav class="navbar navbar-expand-lg  " style="margin-top: 10px;border-radius:20px;background-color:rgba(123,12,13,0.5);">
  <a class="navbar-brand" href="#" style="color: white; font-size: 30px;font-weight: bold;">Online Examination</a>
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
					<h4 style="color: white;">Hello <%=sname %> Welcome To Portal</h4>
					
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
    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 " style="background-color: rgba(180,72,23,0.5);margin-top: 10px;border-radius: 10px;margin-left: 10px;box-shadow: 3px 2px 2px brown;">
    	<h3 style="text-align: center; color: white; font-weight: bold;">Admin Dashboard</h3>	
    		<ul class="nav flex-column " >
  <li class="nav-item">
    <a class="nav-link active mt-3" style="color: white ; font-size: 20px; font-weight: bold;" href="#"><i class="fa-solid fa-user mr-1"></i><span id="profileid">Profile</span></a>
    <hr>
  </li>
  <li class="nav-item">
    <a class="nav-link" style="color: white ; font-size: 20px; font-weight: bold;" href="#"><i class="fa-solid fa-wallet mr-1"></i><span id="courseid">Course</span></a>
    <hr>
  </li>
  <li class="nav-item">
    <a class="nav-link" style="color: white; font-size: 20px; font-weight: bold;" href="#"><i class="fa-solid fa-circle-question mr-1"></i><span id="quetionid">Quetions</span></a>
    <hr>
  </li>
  <li class="nav-item">
    <a class="nav-link " style="color: white; font-size: 20px; font-weight: bold;" href="#"><i class="fa-solid fa-shield-halved mr-1"></i><span id="accountid">Account</span></a>
    <hr>
  </li>
    <li class="nav-item">
    <a class="nav-link " style="color: white; font-size: 20px; font-weight: bold;" href="login.jsp"><i class="fa-solid fa-right-from-bracket mr-1"></i>LogOut</a>
    <hr>
  </li>
  
</ul>
<br><br><br><br><br><br><br><br>
    	</div>
    	<div class="col col-lg-9 col-md-9 col-sm-9 col-xs-9 mt-3">
    	
    			
    			<%
    			int id=(int)session.getAttribute("sid");
    			
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
        			String sql="select * from regtable where  id='"+id+"'";
        			PreparedStatement pst=con.prepareStatement(sql);
        			ResultSet rs=pst.executeQuery();
        			while(rs.next())
        			{
        				id=rs.getInt(1);
        				name=rs.getString(2);
        				email=rs.getString(3);
        				username=rs.getString(4);
        				password=rs.getString(5);
        				gender=rs.getString(6);
        				city=rs.getString(7);
        				registeras=rs.getString(8);
        				address=rs.getString(9);
        				%>
        	<section id="profilesection">
        	<div class="card-body bg-light ">
    			<h3>Admin Detail</h3>
    				<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Name</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="name" id="name" value="<%=name%>" readOnly>
    			<small class="text-danger" id="namecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Email</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="email" id="email" value="<%=email%>" readOnly>
    			<small id="emailcheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">username</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="username" id="username" value="<%=username%>" readOnly>
    			<small id="usernamecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">password</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="passowrd" id="password" value="<%=password%>" readOnly>
    			<small id="passwordcheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">gender</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="gender" id="gender" value="<%=gender%>" readOnly>
    			<small id="gendercheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">city</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="city" id="city" value="<%=city%>" readOnly>
    			<small id="gendercheck"></small>
    			</div>
    	</div>
    	    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Address</label>
    			<div class="col col-sm-9">
    			<textarea rows="3" cols="3" class="form-control" readOnly><%=address%></textarea>
    			<small id="addresscheck"></small>
    			</div>
    	</div>
    	<button type="submit" class="btn btn-primary" id="btnedit">Edit</button>
    		
    			</div>
    			</section>
        				<%
        			}
    			}catch(Exception ex)
    			{
    				out.println("exception "+ex);
    			}
    			
    			%>
   <!-- ------------------------------------------------------------------------------------------------------------------------------------- --> 			
    		<section id="coursesection">
    			<div class="row">
    				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">
    					<div class="card-body bg-light" style="border-radius: 20px;">
    						<section id="addcourse">
    						<h3>Add Course</h3>
    						<div class="form-group">
    							<label>Course Name</label>
    						<input type="text" class="form-control" name="cname" id="cname">
    						</div>	
    						
    						<div class="form-group">
    							<label>Total Mark</label>
    						<input type="text" class="form-control" name="tmark" id="tmark">
    						</div>
    						
    						<div class="form-group">
    							<label>Exam Time</label>
    						<input type="text" class="form-control" name="etime" id="etime">
    						</div>	
    						<div class="form-group">
    						<button type="button" class="btn btn-primary btn-block" id="addcou">ADD</button>
    						</div>	
    						
    						</section>
    					</div>
    				</div>
    				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">
    					<div class="card-body bg-light">
    						<section id="showcourse">
    							

    						</section>
    					</div>
    				</div>
    				
    			</div>	
    		</section>
   <!-- ------------------------------------------------------------------------------------------------------------------------------------- -->	
    		<section id="quetionsection">
    			<h3>quetionsection</h3>
    		</section>
   <!-- ------------------------------------------------------------------------------------------------------------------------------------- -->
    		<section id="accountsection">
    			<h3>accountsection</h3>
    		</section>
    <!-- ------------------------------------------------------------------------------------------------------------------------------------- -->
    </div>
    		</div>
    
    </div>
    
	<script>
	$(document).ready(function() {
		$("#btnedit").click(function() {
			$.get("edit.jsp",{id:<%=id%>},function(data,status){
				$("#profilesection").html(data);
			});
		});
		$("#addcou").click(function() {
			
			 var cname=$("#cname").val();
			var tmark=$("#tmark").val();
			var etime=$("#etime").val();
			
			$.get("addcourseserver.jsp",{cname:cname,tmark:tmark,etime:etime},function(data,status){
				$("#showcourse").html(data);
			});
		});
		/* $(".del").click(function() {
			var id=$(this).data("did");
			$.get("deletecourseserver.jsp",{id:id},function(data,status){
				$("#showcourse").html(data);
			});
		}); */
		$("#courseid").click(function() {
			$.get("showcoursetable.jsp",function(data,status){
				$("#showcourse").html(data);
			});
		});
		
	});
	
	</script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>