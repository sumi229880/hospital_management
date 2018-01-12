<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
<title>We Care</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/signup/signup.css">

<!-- Validations -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
  <script type="text/javascript" src="resources/signup/signupValidations.js"> </script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
    $scope.name = " ";
});
</script>
  <style>#signUpForm label.error{ width:auto; color:red;}
  
  input:focus ~ label, input:valid ~ label 		{
  top:-2px;
}
body{
			    background: radial-gradient(#1d2f66,black); /* Standard syntax (must be last) */
			}
  
  </style>

</head>

<body>

	<script>
		var xmlHttp;

		xmlHttp = GetXmlHttpObject();

		function checkUser() {

			if (xmlHttp == null)

			{

				alert("Your browser does not support AJAX!");

				return;

			}

			var username = document.getElementById("emailId").value;
			var query = "action=ajaxCheck&emailId=" + username;

			xmlHttp.onreadystatechange = function stateChanged()

			{

				if (xmlHttp.readyState == 4)

				{

					document.getElementById("error").innerHTML = xmlHttp.responseText;

				}

			};

			xmlHttp.open("POST", "signup.htm", true);

			xmlHttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			xmlHttp.send(query);

			return false;

		}

		function GetXmlHttpObject()

		{

			var xmlHttp = null;

			try

			{

				// Firefox, Opera 8.0+, Safari

				xmlHttp = new XMLHttpRequest();

			} catch (e)

			{

				// Internet Explorer

				try

				{

					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");

				} catch (e)

				{

					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

				}

			}

			return xmlHttp;

		}
	</script>


	<div id="outer">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="col-md-12">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="logout.htm"><img
							src="resources/img/logo.png" class="img-responsive"
							style="width: 3em; margin-left: -10px; margin-top: -16px;"></a>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<br> <br> <br>
		
		<h1 style="color: royalblue;">
			<strong>REGISTER</strong>
		</h1>
		<h3 style="color: white">${userCreated}</h3>
		<br>
		<form id = "signUpForm" class="form-horizontal" action='register.htm?action=register'
			method="POST" style="width: 55%; float: left;" ng-app="myApp" ng-controller="myCtrl">

			<div class="group" style="margin-bottom:0;padding-bottom:0;" >
				<h4 style="color:white; float:right;">First Name</h4>
				<input type="text" name="firstName"  required> <span
					class="highlight"></span> <span class="bar"></span> <label></label>
					
			</div>
			

			<div class="group" style="margin-bottom:0;padding-bottom:0;">
				<h4 style="color:white; float:right;">Last Name</h4>
				<input type="text" name="lastName" required> <span
					class="highlight"></span> <span class="bar"></span> <label></label>
			</div>

			<div class="group" style="margin-bottom:0;padding-bottom:0;">
			<h4 style="color:white; float:right;">Address</h4>
				<input type="text" name="address" required> <span
					class="highlight"></span> <span class="bar"></span> <label></label>
			</div>

			<div class="group" style="margin-bottom:0;padding-bottom:0;">
			<h4 style="color:white; float:right;">Mobile</h4>
				<input type="text" name="mobileNumber" required> <span
					class="highlight"></span> <span class="bar"></span> <label></label>
			</div>

			<div class="group" style="margin-bottom:0;padding-bottom:0;" >
			<h4 style="color:white; float:right;">Email</h4>
			<input type="email" name="emailId" id="emailId" onblur="return checkUser()" ng-model="name" required> <span
				class="highlight"></span> <span class="bar"></span> <label></label>
				<div id="error" style="color:red"></div>
		</div>

			<div class="group">
			<h4 style="color:white; float:right;">Password</h4>
				<input type="password" name="password" required> <span
					class="highlight"></span> <span class="bar"></span> <label></label>
			</div>
			<p style="color:white" >**Use <em style = "color : yellow"> {{name}} </em>as your User Id</p>
			<div class="controls">
				<button class="btn btn-success">Register</button>
			</div>

		</form>

		
		<!-- width:5% and remove transform for using other image -->
		<div style="width: 13%; margin-left: 62%;">
			<div style="margin: 80%">
				<img id="stethoscope" alt="stethoscope"
					src="resources/img/stethoscope.png">
			</div>
		</div>
	</div>
	<!--footer-->
	<footer id="footer">
		<div class="footer-line">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						© Copyright <strong>S4</strong>. All Rights Reserved
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ footer-->
</body>

</html>