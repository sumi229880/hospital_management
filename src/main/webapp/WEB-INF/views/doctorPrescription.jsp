<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Dashboard</title>

<link href="resources/doctorAssets/css/bootstrap.css" rel="stylesheet" />
<link href="resources/doctorAssets/css/cd.css" rel="stylesheet" />

<link href="resources/doctorAssets/css/font-awesome.css"
	rel="stylesheet" />

<link href="resources/doctorAssets/css/custom-styles.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="resources/doctorAssets/css/imagehover.min.css">
<link rel="stylesheet" href="resources/signup/signup.css">



<link href="resources/doctorAssets/css/custom-styles.css"
	rel="stylesheet" />
<script src="resources/doctorAssets/js/jquery-1.10.2.js"></script>
<script src="resources/doctorAssets/js/bootstrap.min.js"></script>
<script src="resources/doctorAssets/js/doctorPrescriptionValidation.js"></script>
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

<style>
#wrapper {
	background: linear-gradient(to right, #A1ECFF, #0170E3, black);
	background-repeat: none;
}
#doctorPrescription label.error{ width:auto; float:right; color:red;}

.navbar-default {
	background: none;
	background-repeat: none;
}

.navbar-brand {
	background: none;
	background-repeat: none;
}

#page-inner {
	
}

#page-wrapper {
	background: none;
	background-repeat: none;
}

.navbar-header {
	background: none;
}

.grow {
	transition: all .2s ease-in-out;
}

.grow:hover {
	transform: scale(1.1);
}

.switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 21px;
}

.switch input {
	display: none;
}

.switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 21px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: red;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 12px;
	width: 12px;
	left: 5px;
	bottom: 5px;
	background-color: white;
	-webkit-transition: .2s;
	transition: .4s;
}


/* Rounded sliders */
.slider.round {
	border-radius: 20px;
}

.slider.round:before {
	border-radius: 50%;
}

.bar {
	position: relative;
	display: block;
	width: 100%;
}

.bar:before, .bar:after {
	content: '';
	height: 6px;
	width: 0;
	bottom: 0px;
	position: absolute;
	background: black;
	border-radius: 30px;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

/* form starting stylings ------------------------------- */

{ box-sizing:border-box; }

.group 			  { 
  position:relative; 
  margin-bottom:45px; 
}
input 				{
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:80%;
  border:none;
  border-bottom:3px solid royalblue;
  border-radius:5px;
}
input:focus 		{ outline:none; }

/* LABEL ======================================= */
label 				 {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:15px;
  color:#5264AE;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:80%; }
.bar:before, .bar:after 	{
  content:'';
  height:6px; 
  width:0;
  bottom:0px; 
  position:absolute;
  background:cornflowerblue; 
  border-radius:30px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
  
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
  position:absolute;
  height:60%; 
  width:100px; 
  top:25%; 
  left:0;
  pointer-events:none;
  opacity:0.5;
}

/* active state */
input:focus ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}



</style>
<script>


	$(function() {
		var availableTags = [ "Abarelix", "Abilify", "Cafcit", "Cefizox",
				"Combiflam", "Aspirin", "Paracetamol", "Naftifine", "Rabavert", "Wellbutrin",
				"Valcyte", "Raloxifene", "Ogen", "Olux", "Onsolis", "Haloperidol",
				"Halcinonide"];
		$("#tags").autocomplete({
			source : availableTags
		});
	});
</script>

</head>

<body>
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"></a>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<a class="text-warning" style="color: white; text-decoration: none;">Hello
					${user.firstName}</a>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw inverse"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href=""doctorProfile.htm""><i
								class="fa fa-user fa-fw"></i> ${user.firstName} ${user.lastName}</a>
						</li>

						<li class="divider"></li>
						<li><a href="<c:url value='/j_spring_security_logout'/>"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
		</nav>
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu"
					style="font-size: 1.4em; padding-left: 0.5em">

					<li><a class="grow" href="doctorHome.htm"
						style="color: black;"><i class="fa fa-dashboard"></i>
							Dashboard</a></li>
					<li><a href="doctorProfile.htm" class="grow"
						style="color: black;"><i class="fa fa-user-md"></i> User
							Profile</a></li>
					<li><a href="assignedPatient.htm" class="grow"
						style="color: black;"><i class="fa fa-user"></i> Patient</a></li>
					<li><a href="hospitalGallery.htm" class="grow"
						style="color: black;"><i class="fa fa-user"></i> Gallery</a></li>

					<li><a href="doctorDiseases.htm" class="grow"
						style="color: black;"><i class="fa fa-users"></i> Diseases</a></li>
						                    <li>
                        <a href="BloodDonor.htm" style="color:black;" class="grow"><i class="fa fa-tint"></i>Blood Donor</a>
                    </li>

				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header"
							style="color: black; margin: 0px; padding: 0px">
							<strong> Prescription </strong>
						</h1>
					</div>
				</div>
				<!-- /. ROW  -->

				<!--         <div class = "container">-->
				<div class="row">

					<div class="col-lg-12">
						<iframe
							src="https://www.meteoblue.com/en/weather/widget/three?geoloc=detect&nocurrent=0&noforecast=0&noforecast=1&days=7&tempunit=FAHRENHEIT&windunit=MILE_PER_HOUR&layout=dark"
							frameborder="0" scrolling="NO" allowtransparency="true"
							sandbox="allow-same-origin allow-scripts allow-popups"
							style="width: 100%; height: 100%"></iframe>
						<div style="display: none">
							<!-- DO NOT REMOVE THIS LINK -->
							<a
								href="https://www.meteoblue.com/en/weather/forecast/week?utm_source=weather_widget&utm_medium=linkus&utm_content=three&utm_campaign=Weather%2BWidget"
								target="_blank">meteoblue</a>
						</div>
						<br> <br> <br> <br>
					</div>
					<!--	</div>-->

					<br> <br>
					<div class="row">
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div
								class="panel panel-primary text-center no-boder bg-color-green grow">
								<div class="panel-body">
									<i class="fa fa-user-md fa-5x"></i>

								</div>
								<div class="panel-footer back-footer-green">Doctor</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div
								class="panel panel-primary text-center no-boder bg-color-red grow">
								<div class="panel-body">

									<i class="fa fa-user fa-5x"></i>
								</div>
								<div class="panel-footer back-footer-red">Patient</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div
								class="panel panel-primary text-center no-boder bg-color-blue grow">
								<div class="panel-body">


									<i class="fa fa-user fa-5x"></i>

								</div>
								<div class="panel-footer back-footer-blue">Receptionist</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div
								class="panel panel-primary text-center no-boder bg-color-brown grow">
								<div class="panel-body">
									<i class="fa fa-users fa-5x"></i>

								</div>
								<div class="panel-footer back-footer-brown">Departments</div>
							</div>
						</div>
					</div>
					<br> <br>

					<div >
					<form class="form-horizontal" action='doctorPrescriptionSubmit.htm'
						method="POST" id ="doctorPrescription" style="width: 45%; float: left;">



						<div class="group" style="margin-bottom: 0px;">
						<p>
								<strong>Doctor's Note</strong>
							</p>
							<label></label> <input type="text" name="details" required>
							<span class="highlight"></span> <span class="bar"></span>

						</div>


						<div class="group" style="margin-bottom: 0px;">
						<p>
								<strong>Consultation Fees</strong>
							</p>
							<label></label> <input type="text"
								name="consultationFees" required> <span
								class="highlight"></span> <span class="bar"></span>

						</div>

						<div class="group" style="margin-bottom: 0px;">
						<p>
								<strong>Tax</strong>
							</p>
							<label></label> <input type="text" name="tax" placeholder="14.6%" disabled>
							<span class="highlight"></span> <span class="bar"></span>

						</div>

						<div class="group" style="margin-bottom: 0px;">
						<p>
								<strong>Other Charges</strong>
							</p>
							<label></label> <input type="text"
								name="otherCharges" required> <span class="highlight"></span>
							<span class="bar"></span>

						</div>

						<div class="group" style="margin-bottom: 0px;">
						<p>
								<strong>Discount</strong>
							</p>
							<label></label> <input type="text" name="discount"
								required> <span class="highlight"></span> <span
								class="bar"></span>

						</div>

						<div class="group">
						<p>
								<strong>Price</strong>
							</p>
							<label></label> <input type="text" name="price" value="${medicine_Price}" required>
							<span class="highlight"></span> <span class="bar"></span>

						</div>
						<div>
						<button type="submit" class="btn btn-success btn-lg">Submit</button></div>
					</form>
					</div>
					<div >
						<form class="form-horizontal" action='doctorMedicines.htm'
					method="POST" style="width: 45%; float: left;">
					<div class="ui-widget">
						<h2 style="color:white;">Enter medicine name for price</h2>
						<br>
						<label for="tags">Tags: </label> <input name="tags" id="tags">
					</div>
					</br></br>
					<div>
					
					<button type="submit" class="btn btn-success btn-lg">Submit</button>
					</div>
				</form>
					
					
					</div>
				</div>
			</div>
		</div>



		<script src="resources/assets/js/dataTables/jquery.dataTables.js"></script>
		<script src="resources/assets/js/dataTables/dataTables.bootstrap.js"></script>
		<script>
			$(document).ready(function() {
				$('#dataTables-example').dataTable();
			});
		</script>
</body>

</html>
