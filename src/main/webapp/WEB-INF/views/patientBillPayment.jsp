<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Patient Dashboard</title>

<link href="resources/assets/css/bootstrap.css" rel="stylesheet" />
<link href="resources/assets/css/font-awesome.css" rel="stylesheet" />
<link href="resources/assets/css/custom-styles.css" rel="stylesheet" />
<link href="resources/payment/css/payment.js" rel="stylesheet" />

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
							style="color: white; margin: 0px; padding: 0px">Payment</h1>
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

					</div>
					<div class="row" style="margin-left:5%;margin-right:5%">
					
					<div class="col-xs-12 col-md-12">


<!-- CREDIT CARD FORM STARTS HERE -->
<div class="panel panel-default credit-card-box">
<div class="panel-heading display-table" >
<div class="row display-tr" >
<h3 class="panel-title display-td" ></h3>
<div class="display-td" >                            
<img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
</div>
</div>                    
</div>
<div class="panel-body">
<form role="form" id="payment-form" action="paidBill.htm" method="post">
<div class="row">
<div class="col-xs-12">
<div class="form-group">
<label for="cardNumber">CARD NUMBER</label>
<div class="input-group">
											<input type="tel" class="form-control" name="cardNumber"
												placeholder="Valid Card Number" autocomplete="cc-number"
												required autofocus /> <span class="input-group-addon"><i
												class="fa fa-credit-card"></i></span>
										</div>
</div>                            
</div>
</div>
<div class="row">
<div class="col-xs-7 col-md-7">
<div class="form-group">
										<label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span
											class="visible-xs-inline">EXP</span> DATE</label> <input type="tel"
											class="form-control" name="cardExpiry" placeholder="MM / YY"
											autocomplete="cc-exp" required />
									</div>
</div>
<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cardCVC">CVV CODE</label> <input type="tel"
											class="form-control" name="cvv" placeholder="CVV"
											autocomplete="cc-csc" required />
									</div>
								</div>
</div>
<div class="row">
<div class="col-xs-12">
<div class="form-group">
										<label for="couponCode">Total Amount</label> <input type="text"
											class="form-control" name="totalAmount" value="${totalAmount}" disabled />
											<input type="hidden" name="hiddenTotalAmount" value="${totalAmount}"> 
									</div>
</div>                        
</div>
<div class="row">
<div class="col-xs-12">
<button class="btn btn-success btn-lg btn-block" type="submit">Pay</button>
</div>
</div>
<div class="row" style="display:none;">
<div class="col-xs-12">
<p class="payment-errors"></p>
</div>
</div>
</form>
</div>
</div>            
<!-- CREDIT CARD FORM ENDS HERE -->


</div>
					</div>
					</div>
					


</div>
</div>
</body>
</html>
