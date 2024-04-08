
<!doctype html>

<html lang="en">

  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body>
    <div class="container-fluid">
		<div class="row">
			<div class="col col-lg-4 col-md-4"></div>
			<div class="col col-lg-4 col-md-4">
			 <%
			 	String sreg=(String)session.getAttribute("sreg");
				 if(sreg==null)
				 {
					 
				 }
				 else
				 {
					 %>
					 	<script>
					 	
					 	swal("<%=sreg %>","","success")

					 	</script>					 
					 <%
				 }
				 session.setAttribute("sreg", null);
			 %>
			 
			  <%
			 	String slogin=(String)session.getAttribute("slogin");
				 if(slogin==null)
				 {
					 
				 }
				 else
				 {
					 %>
					 <script >
					 swal("<%=slogin %>","","error")
					 </script>
					 	
					 <%
				 }
				 session.setAttribute("slogin", null);
			 %>
			
			
				<form action="loginserver.jsp" style="border: 2px solid black; border-radius: 20px; padding: 7px"   >
					<div class="form-group row mt-2">
						<label class="col col-sm-3 col-form-label">Email/Username</label>
						<div class="col col-sm-9">
						<input class="form-control" type="text" name="uname">
						<small class="text-danger" id="unamecheck"></small>
						</div>					
					</div>
					<div class="form-group row">
						<label class="col col-sm-3 col-form-label">Password</label>
						<div class="col col-sm-9">
						<input class="form-control" type="text" name="pass">
						<small class="text-danger" id="passcheck"></small>
						</div>					
					</div>
					
					<div class="form-group row">
						<label class="col col-sm-3 col-form-label"></label>
						<div class="col col-sm-9">
						<button type="submit" class="btn btn-success">Login</button>
						</div>					
					</div>
					<div class="form-group row">
						<label class="col col-sm-3 col-form-label"></label>
						<div class="col col-sm-9">
						<label><a>forgot Password</a></label> | <label><a href="registerform.jsp">Sign In</a></label>
						</div>					
					</div>
					</form>
			</div>
			<div class="col col-lg-4 col-md-4"></div>
		</div>
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>