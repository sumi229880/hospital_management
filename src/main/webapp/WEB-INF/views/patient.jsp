<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

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

.disabled {
	pointer-events: none;
	cursor: default;
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

input:checked+.slider {
	background-color: green;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
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
				<a class="navbar-brand" href="patientHome.htm"></a>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<a class="text-warning" style="color: white; text-decoration: none;">Hello
					${user.firstName}</a>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw inverse"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="patientProfile.htm"><i
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
							style="color: black; margin: 0px; padding: 0px">
							<strong>Patient Dashboard</strong>
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
						<a href="patientProfile.htm"><div
								class="col-md-3 col-sm-12 col-xs-12">
								<div
									class="panel panel-primary text-center no-boder bg-color-brown grow">
									<div class="panel-body">

										<i class="fa fa-user fa-5x" style="color: #ffa64d;"></i></a>
					</div>
					<div class="panel-footer back-footer-red"
						style="background-color: #ffa64d; color: white;">

						<a href="patientProfile.htm" class="grow" style="color: white;">My
							Details</a>
					</div>
				</div>
			</div>
			</a> <a href="#" class="grow" onclick="myFunction();"><div
					class="col-md-3 col-sm-12 col-xs-12">
					<div
						class="panel panel-primary text-center no-boder bg-color-green grow">
						<div class="panel-body">
							<i class="fa fa-file-text-o fa-5x" style="color: #00b33c;"></i>


						</div>
						<div class="panel-footer back-footer-green"
							style="background-color: #00b33c; color: white;">
							<a class="grow" style="color: white;">Appointment</a>
						</div>
					</div>
				</div> </a> <a href="viewBill.htm">
				<div class="col-md-3 col-sm-12 col-xs-12">
					<div
						class="panel panel-primary text-center no-boder bg-color-blue grow">
						<div class="panel-body">


							<i class="fa fa-credit-card fa-5x" aria-hidden="true"></i>

						</div>
						<div class="panel-footer back-footer-blue"
							style="background-color: #00ace6; color: white;">My Bill</div>
					</div>
				</div>
			</a>
			<div class="col-md-3 col-sm-12 col-xs-12">
				<div
					class="panel panel-primary text-center no-boder bg-color-red grow">
					<div class="panel-body">
						<i class="fa fa-heart fa-5x" aria-hidden="true"></i>

					</div>
					<div class="panel-footer back-footer-brown"
						style="background-color: #ff3333; color: white;">Healtyhy
						Life</div>
				</div>
			</div>
		</div>


		<div class="row" id="appointmentTable">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-heading">Appointment List</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>Appointment ID</th>
										<th>Appointment Date</th>

										<th>Doctor Name</th>
										<th>Reason</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${appointments}" var="appointment">
										<tr class="odd gradeX">
											<c:if test="${appointment.status == 1}">
												<td><a
													href="patientPrescription.htm?action1=${appointment.appointmentId}"
													class="disabled">${appointment.appointmentId}</a></td>
											</c:if>
											<c:if test="${appointment.status == 2}">
												<td><a
													href="patientPrescription.htm?action1=${appointment.appointmentId}">${appointment.appointmentId}</a></td>
											</c:if>
											<td>${appointment.appointmentDate}</td>
											<td>${appointment.user.firstName}</td>
											<td>${appointment.reason}</td>

											<c:if test="${appointment.status == 1}">
												<td><label class="switch"> <input
														type="checkbox" disabled>
														<div class="slider round"></div>
												</label></td>
											</c:if>
											<c:if test="${appointment.status == 2}">
												<td><label class="switch"> <input
														type="checkbox" checked="checked" disabled>
														<div class="slider round"></div>
												</label></td>
											</c:if>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>

		<div class="row" id="apppintmentForm">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Book Appointment</h3>
					</div>
					<div class="panel-body">

						<form class="form-horizontal"
							action="bookAppointment.htm?action=book" method="POST">

							<div class="form-group">
								<label class="control-label col-sm-2" for="Doctor">Doctor:</label>
								<div class="col-sm-10">
									<select class="form-control" id="selectDoctor"
										name="selectDoctor">

										<option>Select Doctor</option>
										<c:forEach items="${doctorList}" var="doctor">
											<option>Dr. ${doctor}</option>

										</c:forEach>


									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="Doctor">Appointment
									For:</label>
								<div class="col-sm-10">
									<select class="form-control" id="appointmentFor"
										name="appointmentFor">

										<option>Appointment For</option>
										<option>Self</option>
										<option>Brother</option>
										<option>Sister</option>
										<option>Spouse</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="appDate">Appointment
									Date:</label>
								<div class="col-sm-10">
									<input type="date" class="form-control" id="date" name="date">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="comment">Reason:</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="5" id="reason"
										name="reason" placeholder="Enter Reason ..."></textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Book
										Appointment</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>





	</div>





	</div>
	</div>
	</div>

	<script src="resources/assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="resources/assets/js/morris/morris.js"></script>

	<script src="resources/assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="resources/assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>

	<script>
		function myFunction() {
			var x = document.getElementById('apppintmentForm');
			var y = document.getElementById('appointmentTable');
			if (x.style.display === 'none') {

				y.style.display = 'none';

			} else {

				x.style.display = 'block';
				y.style.display = 'none';
			}

		}
	</script>

</body>
</html>
