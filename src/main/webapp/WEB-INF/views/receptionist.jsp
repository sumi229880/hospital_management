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
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<script>
var app = angular.module("dailyTasksList", []); 
app.controller("myCtrl", function($scope) {
    $scope.products = ["Check Appointments", "Check Doctor Schedules", "Check Billings", "Check any Meeting", "Follow Up with Patients", "Send Required Alerts", "Maintain Silence"];
    $scope.addItem = function () {
        $scope.errortext = "";
        if (!$scope.addMe) {return;}
        if ($scope.products.indexOf($scope.addMe) == -1) {
            $scope.products.push($scope.addMe);
        } else {
            $scope.errortext = "The item is already in your Tasks list.";
        }
    }
    $scope.removeItem = function (x) {
        $scope.errortext = "";    
        $scope.products.splice(x, 1);
    }
});
</script>
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
		<br>
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


                <span><div class="row"></div></span>
				
					<div class = "col-md-6" ng-app="dailyTasksList" ng-cloak ng-controller="myCtrl" class="w3-card-2 w3-margin" style="max-width:100%; max-height: 100%">
					  
					  <h2 style = "color:white";>To Do List <i class="fa fa-tasks" aria-hidden="true" style = "color:#002851";></i></i></h2><br>
					  <header class="w3-container w3-light-grey w3-padding-16">
					    <h3>Daily Tasks For Receptionist</h3>
					  </header>
					  <ul class="w3-ul">
					    <li ng-repeat="x in products" class="w3-padding-16">{{x}}<span ng-click="removeItem($index)" style="cursor:pointer;" class="w3-right w3-margin-right">×</span></li>
					  </ul>
					  <div class="w3-container w3-light-grey w3-padding-16">
					    <div class="w3-row w3-margin-top">
					      <div class="w3-col s10">
					        <input placeholder="Add Tasks here" ng-model="addMe" class="w3-input w3-border w3-padding">
					      </div>
					      <div class="w3-col s2">
					        <button ng-click="addItem()" class="w3-btn w3-padding w3-green">Add</button>
					      </div>
					    </div>
					    <p class="w3-padding-left w3-text-red">{{errortext}}</p>
					  </div>
					</div>					
				
               <div class = "col-md-6">
					<h2 style = "color:white";>Instagram <i class="fa fa-instagram" aria-hidden="true" style = "color:pink";></i></h2><br>
					<!-- SnapWidget -->
					<script src="https://snapwidget.com/js/snapwidget.js"></script>
					<iframe src="https://snapwidget.com/embed/370923" class="snapwidget-widget" allowTransparency="true" frameborder="9" scrolling="no" style="border:none; overflow:hidden; width:100%; "></iframe>					
				</div>
                
                
            </div>
        </div>
        </div>
</body>

</html>
