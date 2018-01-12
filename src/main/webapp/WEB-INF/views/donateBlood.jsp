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
    
<script src="resources/assets/js/jquery-1.10.2.js"></script>
<script src="resources/assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/signup/signup.css">



<style>
#wrapper {
	background: linear-gradient(to right, #A1ECFF, #0170E3, black);
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
		<nav class="navbar navbar-default top-navbar" style="background:none;" role="navigation">
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
		<nav class="navbar-default navbar-side" style="background:none;" role="navigation">
			<div class="sidebar-collapse">
                <ul class="nav" id="main-menu" style="font-size:1.4em; padding-left:0.5em">

                    <li>
                        <a class="grow" href="patientHome.htm" style="color:black;"><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="patientDoctors.htm" class="grow" style="color:black;"><i class="fa fa-user-md"></i> Doctor</a>
                    </li>

                    <li>
                        <a href="#" class="grow" style="color:black;" onclick="myFunction();"><i class="fa fa-file-text-o"></i> Book Appointment</a>
                    </li>
                    <li>
                        <a href="viewBill.htm" style="color:black;" class="grow"><i class="fa fa-user"></i> View Bill</a>
                    </li>
                     <li>
                        <a href="donateBlood.htm" style="color:black;" class="grow"><i class="fa fa-tint"></i> Donate Blood</a>
                    </li>
                     <li>
                        <a href="patientRegisterEvent.htm" class="grow" style="color:black;"><i class="fa fa-calendar"></i> Register Event</a>
                    </li>
                </ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" >
			<div class="row" style="float:right;">
					
			</div>
			<br>
			
			<h1 style = "color:black";>Blood Donation <i class="fa fa-flask" aria-hidden="true" style = "color:black";></i></h1>
			<hr>
			<br>
			<h1>${message}</h1>
			<form class="form-horizontal" action='submitdonateBlood.htm'
				method="POST" style="width: 55%; float: left;">

				<div class="group">
					<p>
						<strong>Blood Group</strong>
					</p>
					<select name="blood" class="form-control" required>
						<option value="volvo">Select Blood-Group</option>
						<option value="A+">A+</option>
						<option value="A-">A-</option>
						<option value="B+">B+</option>
						<option value="B-">B-</option>
						<option value="O">O+</option>
						<option value="O-">O-</option>
						<option value="AB+">AB+</option>
						<option value="AB-">AB-</option>
					</select> <span class="bar"></span>
				</div>

				<div class="group">
					<p>
						<strong>Blood donated on</strong>
					</p>

					<input type="Date" name="date" required> <span
						class="highlight"></span> <span class="bar"></span>
				</div>

				<div class="group">
					<p>
						<strong>Contact me in future</strong>
					</p>
					<input type="radio" name="contact" value="Yes" checked> Yes<br>
					<input type="radio" name="contact" value="No"> No<br>
				</div>



				<div class="controls">
					<button class="btn btn-success">Donate</button>
				</div>

			</form>










		</div>
		<span><i><small>Copyright &copy; 2016 Siddharth</small></i></span>





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
	<script type="text/javascript">
      $(document).ready(function () {
        var carousel = $("#carousel").waterwheelCarousel({
          flankingItems: 3,
          movingToCenter: function ($item) {
            $('#callback-output').prepend('movingToCenter: ' + $item.attr('id') + '<br/>');
          },
          movedToCenter: function ($item) {
            $('#callback-output').prepend('movedToCenter: ' + $item.attr('id') + '<br/>');
          },
          movingFromCenter: function ($item) {
            $('#callback-output').prepend('movingFromCenter: ' + $item.attr('id') + '<br/>');
          },
          movedFromCenter: function ($item) {
            $('#callback-output').prepend('movedFromCenter: ' + $item.attr('id') + '<br/>');
          },
          clickedCenter: function ($item) {
            $('#callback-output').prepend('clickedCenter: ' + $item.attr('id') + '<br/>');
          }
        });

        
      });
    </script>

</body>
</html>
