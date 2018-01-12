<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Patient Dashboard</title>

<link href="resources/assets/css/bootstrap.css" rel="stylesheet" />
<link href="resources/assets/css/font-awesome.css" rel="stylesheet" />
<link href="resources/assets/css/custom-styles.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/imagehover.min.css">
<script src="resources/assets/js/jquery-1.10.2.js"></script>
<script src="resources/assets/js/bootstrap.min.js"></script>
<style>
#wrapper {
	background: linear-gradient(to right, #A1ECFF, #0170E3, black);
	background-repeat: none;
}

.glyphicon {
	font-size: 65px;
}

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

#apppintmentForm {
	display: none;
}

#viewDetails {
	display: none;
}

/* form starting stylings ------------------------------- */
* {
	box-sizing: border-box;
}

.group {
	position: relative;
	margin-bottom: 45px;
}

input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	display: block;
	width: 100%;
	border: none;
	border-bottom: 3px solid royalblue;
	border-radius: 5px;
}

input:focus {
	outline: none;
}

/* LABEL ======================================= */
label {
	color: #999;
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label {
	top: -20px;
	font-size: 15px;
	color: #5264AE;
}

/* BOTTOM BARS ================================= */
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
	background: cornflowerblue;
	border-radius: 30px;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

.bar:before {
	left: 50%;
}

.bar:after {
	right: 50%;
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
	width: 50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
	position: absolute;
	height: 60%;
	width: 100px;
	top: 25%;
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}

/* active state */
input:focus ~ .highlight {
	-webkit-animation: inputHighlighter 0.3s ease;
	-moz-animation: inputHighlighter 0.3s ease;
	animation: inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@
-webkit-keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}

}
@
-moz-keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}

}
@
keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}
}
</style>


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
				<a class="navbar-brand" href="index.html">Patient</a>
			</div>

			<ul class="nav navbar-top-links navbar-right">

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
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

					<li><a class="grow" href="patientHome.htm"
						style="color: black;"><i class="fa fa-dashboard"></i>
							Dashboard</a></li>
					<li><a href="patientDoctors.htm" class="grow"
						style="color: black;"><i class="fa fa-user-md"></i> Doctor</a></li>

					<li><a href="#" class="grow" style="color: black;"
						onclick="myFunction();"><i class="fa fa-file-text-o"></i> Book
							Appointment</a></li>
					<li><a href="viewBill.htm" style="color: black;" class="grow"><i
							class="fa fa-user"></i> View Bill</a></li>
					<li><a href="donateBlood.htm" style="color: black;"
						class="grow"><i class="fa fa-tint"></i> Donate Blood</a></li>
					<li><a href="patientRegisterEvent.htm" class="grow"
						style="color: black;"><i class="fa fa-calendar"></i> Register
							Event</a></li>
				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header"
							style="color: white; margin: 0px; padding: 0px">Dashboard</h1>
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
								class="panel panel-primary text-center no-boder bg-color-brown grow">
								<div class="panel-body">

									<a href="#" class="grow" onclick="detailsFunc();"><i
										class="fa fa-user fa-5x" style="color: #ffa64d;"></i></a>
								</div>
								<div class="panel-footer back-footer-red"
									style="background-color: #ffa64d; color: white;">

									<a href="#" class="grow" onclick="detailsFunc();"
										style="color: white;">My Details</a>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div
								class="panel panel-primary text-center no-boder bg-color-green grow">
								<div class="panel-body">
									<a class="grow" href="index.html"> <i
										class="fa fa-file-text-o fa-5x" style="color: #00b33c;"></i>
									</a>

								</div>
								<div class="panel-footer back-footer-green"
									style="background-color: #00b33c; color: white;">
									<a class="grow" href="index.html" style="color: white;">Appointment</a>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-12 col-xs-12">
							<div
								class="panel panel-primary text-center no-boder bg-color-blue grow">
								<div class="panel-body">


									<i class="fa fa-credit-card fa-5x" aria-hidden="true"></i>

								</div>
								<div class="panel-footer back-footer-blue"
									style="background-color: #00ace6; color: white;">My Bill

								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div
								class="panel panel-primary text-center no-boder bg-color-red grow">
								<div class="panel-body">
									<i class="fa fa-heart fa-5x" aria-hidden="true"></i>

								</div>
								<div class="panel-footer back-footer-brown"
									style="background-color: #ff3333; color: white;">
									Healtyhy Life</div>
							</div>
						</div>
					</div>


					<!-- Form -->

					<form class="form-horizontal" action='billPayment.htm'
						method="POST" style="width: 55%; float: left;">


						<div class="group" style="margin-bottom: 0px;">
							<p>
								<strong>Doctor's Note</strong>
							</p>
							<label></label> <input type="text" name="details"
								value="${prescription.details}" disabled> <span
								class="highlight"></span> <span class="bar"></span>
						</div>


						<div class="group" style="margin-bottom: 0px;">
							<p>
								<strong>Consultation Fees</strong>
							</p>
							<label></label> <input type="text" name="consultationFees"
								value="${prescription.consultationFees}" disabled> <span
								class="highlight"></span> <span class="bar"></span> <input
								type="hidden" name="hiddenFees"
								value="${prescription.consultationFees}">
						</div>

						<div class="group" style="margin-bottom: 0px;">
							<p>
								<strong>Tax</strong>
							</p>
							<label></label> <input type="text" name="tax"
								value="${prescription.tax}" disabled> <span
								class="highlight"></span>

						</div>

						<div class="group" style="margin-bottom: 0px;">
							<p>
								<strong>Other Charges</strong>
							</p>
							<label></label> <input type="text" name="otherCharges"
								value="${prescription.charges}" disabled> <span
								class="highlight"></span> <span class="bar"></span> <input
								type="hidden" name="hiddenCharges"
								value="${prescription.charges}">

						</div>

						<div class="group" style="margin-bottom: 0px;">
							<p>
								<strong>Discount</strong>
							</p>
							<label></label> <input type="text" name="discount"
								value="${prescription.discount}" disabled> <span
								class="highlight"></span> <span class="bar"></span> <input
								type="hidden" name="hiddenDiscount"
								value="${prescription.discount}">
						</div>
						<div class="group" style="margin-bottom: 0px;">
							<p>
								<strong>Medicine Price</strong>
							</p>
							<label></label> <input type="text" name="medicinePrice"
								value="${prescription.medicinePrice}" disabled> <span
								class="highlight"></span> <span class="bar"></span> 
						</div>
						
						<button class="btn btn-success" type="submit">Pay Now</button>
					</form>
				</div>
</body>
</html>
