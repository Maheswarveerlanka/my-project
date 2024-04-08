<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Hello, world!</title>
  </head>
  <body>
    <div class="container-fluid">
    <div class="row">
    <div class="col col-lg-2 col-md-2 col-sm-2"></div>
    <div class="col col-lg-8 col-md-8 col-sm-8">
   
    	<form action="regserver.jsp" onsubmit=" validate()">
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Name</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="name" id="fullname">
    			<small class="text-danger" id="fullnamecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">Email</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="email" id="email">
    			<small class="text-danger" id="emailcheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">username</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="username" id="username">
    			<small class="text-danger" id="usernamecheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">password</label>
    			<div class="col col-sm-9">
    			<input type="text" class="form-control" name="password" id="password">
    			<small class="text-danger" id="passwordcheck"></small>
    			</div>
    	</div>
    	    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">gender</label>
    			<div class="col col-sm-9">
    			<select  class="form-control" name="gender" id="gender">
    				<option>select</option>
    				<option>male</option>
    				<option>female</option>
    				<option>other</option>
    			</select>
    			<small class="text-danger" id="gendercheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">city</label>
    			<div class="col col-sm-9">
    			<select  class="form-control" name="city" id="city">
    				<option>select</option>
    				<option>nagpur</option>
    				<option>pune</option>
    				<option>hyderabad</option>
    				<option>mumbai</option>
    				<option>delhi</option>
    			</select>
    			<small class="text-danger" id="citycheck"></small>
    			</div>
    	</div>
    	    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label">address</label>
    			<div class="col col-sm-9">
    			<textarea rows="3" cols="3" class="form-control" name="address" id="address"></textarea>
    			<small class="text-danger" id="addresscheck"></small>
    			</div>
    	</div>
    	<div class="form-group row">
    		<label class="col-sm-3 col-form-label"></label>
    			<div class="col col-sm-9">
    			<button type="submit" class="btn btn-success">Register</button>
    			</div>
    	</div>
    	
    	</form>
    	
    </div>
    <div class="col col-lg-2 col-md-2 col-sm-2"></div>
    </div>
    
    </div>
    <script >
    	function validate() 
    	{
			var fullname=document.getElementById("fullname").value;
			var letters = /^[A-Za-z]+$/;
			
			var email=document.getElementById("email").value;
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			
			var username=document.getElementById("username").value;
			
			var password=document.getElementById("password").value;
			var passw=  /^[A-Za-z]\w{7,14}$/;
			var cnfpass=document.getElementById("cnfpass").value;
			
			var gender=document.getElementById("gender").value;
			var city=document.getElementById("city").value;
			var registeras=document.getElementById("registeras").value;
			var address=document.getElementById("address").value;	
			
			if(fullname==""||fullname==null)
				{
					document.getElementById("fullnamecheck").innerHTML="* fullname field is Required";
					document.getElementById("fullname").focus();
					return false;
				}
			else if(!(fullname.match(letters)))
			{
				document.getElementById("fullnamecheck").innerHTML="* Enter valid Fullname";
				document.getElementById("fullname").focus();
				return false;
			}
			else if(email==""||email==null)
			{
				document.getElementById("emailcheck").innerHTML="* Email field is Required";
				document.getElementById("email").focus();
				return false;
			}
			else if(!(email.match(mailformat)))
			{
				document.getElementById("emailcheck").innerHTML="* Enter valid Email";
				document.getElementById("email").focus();
				return false;
			}
			else if(username==""||username==null)
			{
				document.getElementById("usernamecheck").innerHTML="* Username field is Required";
				document.getElementById("username").focus();
				return false;
			}
			else if(password==""||password==null)
			{
				document.getElementById("passwordcheck").innerHTML="* Password field is Required";
				document.getElementById("password").focus();
				return false;
			}
			else if(!(password.match(passw)))
			{
				document.getElementById("passwordcheck").innerHTML="* a password must between 7 to 16 characters which contain only characters, numeric digits, underscore and first character must be a letter";
				document.getElementById("password").focus();
				return false;
			}
			else if(cnfpass==""||cnfpass==null)
			{
				document.getElementById("cnfpasscheck").innerHTML="* Password field is Required";
				document.getElementById("cnfpass").focus();
				return false;
			}
			else if(!(password==cnfpass))
			{
				document.getElementById("cnfpasscheck").innerHTML="* Password Does not Match";
				document.getElementById("cnfpass").focus();
				return false;
			}
			else if(gender=="select")
			{
				document.getElementById("gendercheck").innerHTML="* Gender field is Required";
				document.getElementById("gender").focus();
				return false;
			}
			else if(city=="select")
			{
				document.getElementById("citycheck").innerHTML="* City field is Required";
				document.getElementById("city").focus();
				return false;
			}
			else if(gender=="select")
			{
				document.getElementById("gendercheck").innerHTML="* Gender field is Required";
				document.getElementById("gender").focus();
				return false;
			}
			else if(registeras=="select")
			{
				document.getElementById("registerascheck").innerHTML="* Select Admin or Student";
				document.getElementById("registeras").focus();
				return false;
			}
			else if(address==""||address==null)
			{
				document.getElementById("addresscheck").innerHTML="* Address field is Required";
				document.getElementById("address").focus();
				return false;
			}

			return true;
    	}
	    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>