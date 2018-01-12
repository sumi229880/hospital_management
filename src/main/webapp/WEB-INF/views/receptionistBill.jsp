<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Receptionist Dashboard</title>

    <link href="resources/adminAssets/css/bootstrap.css" rel="stylesheet" />
    <link href="resources/adminAssets/css/font-awesome.css" rel="stylesheet" />
    <link href="resources/adminAssets/css/custom-styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="resources/adminAssets/css/imagehover.min.css">
    <script src="resources/adminAssets/js/jquery-1.10.2.js"></script>
    <script src="resources/adminAssets/js/bootstrap.min.js"></script>
    <style>
#wrapper {
	background: linear-gradient(to right, #A1ECFF, #0170E3, black);
	background-repeat: none;
}
    
    </style>
    
</head>

<body>
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
    <div id="wrapper" >
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"></a>
            </div>
			
            <ul class="nav navbar-top-links navbar-right">
				<a class="text-warning" style = "color:white">Hello  ${user.firstName}</a>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw inverse"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    <li><a href="recptionistProfile.htm"><i class="fa fa-user fa-fw"></i> ${user.firstName} ${user.lastName}</a>
                        </li>
                       
                        <li class="divider"></li>
						<li><a href="<c:url value='/j_spring_security_logout'/>"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
               <ul class="nav" id="main-menu" style="font-size:1.4em; padding-left:0.5em">

                    <li>
                        <a class="grow" href="recptionistHome.htm" style="color:black;"><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="receptionistAllDoctor.htm" class="grow" style="color:black;"><i class="fa fa-user-md"></i> Doctors</a>
                    </li>
                    <li>
                        <a href="receptionistAllPatient.htm" class="grow" style="color:black;"><i class="fa fa-user"></i> Patients</a>
                    </li>
                    <li>
                        <a href="receptionistAppointments.htm" class="grow" style="color:black;"><i class="fa fa-user"></i> Appointments</a>
                    </li>

                    <li>
                        <a href="receptionistBill.htm" class="grow" style="color:black;"><i class="fa fa-users"></i> Billing</a>
                    </li>

                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header" style="color:black; margin:0px; padding:0px">
                            <strong>Receptionist Dashboard</strong>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                
<!--         <div class = "container">-->
		<div class="row">
		
		<div class="col-lg-12">
			<iframe src="https://www.meteoblue.com/en/weather/widget/three?geoloc=detect&nocurrent=0&noforecast=0&noforecast=1&days=7&tempunit=FAHRENHEIT&windunit=MILE_PER_HOUR&layout=dark"  frameborder="0" scrolling="NO" allowtransparency="true" sandbox="allow-same-origin allow-scripts allow-popups" style="width:100%;height: 100%"></iframe><div style="display:none"><!-- DO NOT REMOVE THIS LINK --><a href="https://www.meteoblue.com/en/weather/forecast/week?utm_source=weather_widget&utm_medium=linkus&utm_content=three&utm_campaign=Weather%2BWidget" target="_blank">meteoblue</a></div>
		<br><br><br><br>
		</div>
<!--	</div>-->

                <br><br>
                <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green grow">
                            <div class="panel-body">
                                <i class="fa fa-user-md fa-5x"></i>

                            </div>
                            <div class="panel-footer back-footer-green">
                                Doctor
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-red grow">
                            <div class="panel-body">

                                <i class="fa fa-user fa-5x"></i>
                            </div>
                            <div class="panel-footer back-footer-red">
                                Patient

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue grow">
                            <div class="panel-body">


                                <i class="fa fa-user fa-5x"></i>

                            </div>
                            <div class="panel-footer back-footer-blue">
                                Receptionist

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown grow">
                            <div class="panel-body">
                                <i class="fa fa-users fa-5x"></i>

                            </div>
                            <div class="panel-footer back-footer-brown">
                                Departments

                            </div>
                        </div>
                    </div>
                </div>


                                   <div class="row" id="appointmentTable">
                        <div class="col-md-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Advanced Tables
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Payment Id</th>
                                                    <th>Patient Name</th>
                                                    <th>Address</th>
                                                    <th>Email Id</th>
                                                    <th>Total Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <c:forEach items="${paymentList}" var="payment">
												<tr class="odd gradeX">
                                                    <td>${payment.paymentId}</a></td>
                                                    <td>${payment.appointment.user1}</td>
                                                    <td>${payment.appointment.user1.address}</td>
                                                    <td>${payment.appointment.user1.emailId}</td>
                                                    <td>${payment.totalAmount}</td>
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
        <script>
        function detailsFunc() {
            var x = document.getElementById('viewDetails');
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
