<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctor Dashboard</title>

    <link href="resources/Galleryassets/css/bootstrap.css" rel="stylesheet" />

    <link href="resources/Galleryassets/css/font-awesome.css" rel="stylesheet" />

    <link href="resources/Galleryassets/css/custom-styles.css" rel="stylesheet" />
        <link href="resources/css/imagehover.min.css" rel="stylesheet" />
    

    <link href="resources/Galleryassets/css/custom-styles.css" rel="stylesheet" />
    <script src="resources/Galleryassets/js/jquery-1.10.2.js"></script>
    <script src="resources/Galleryassets/js/bootstrap.min.js"></script>

    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 100%;
            margin: auto;
        }

    </style>
    
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>



</head>

<body>
<% response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
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
        
        #page-inner {}
        
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
        
        input:checked + .slider {
            background-color: green;
        }
        
        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }
        
        input:checked + .slider:before {
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
        
        img {
            filter: none;
            /* IE6-9 */
            -webkit-filter: grayscale(0);
            /* Google Chrome, Safari 6+ & Opera 15+ */
            -webkit-box-shadow: 0px 2px 6px 2px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 2px 6px 2px rgba(0, 0, 0, 0.75);
            box-shadow: 0px 2px 6px 2px rgba(0, 0, 0, 0.75);
            margin-bottom: 20px;
        }
        
        img:hover {
/*            filter: gray;*/
            transform: scale(1.2);
            /* IE6-9 */
            -webkit-filter: grayscale(1);
            /* Google Chrome, Safari 6+ & Opera 15+ */
        }

    </style>
    <div id="wrapper">
   
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

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
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
                        <a class="grow" href="doctorHome.htm" style="color:black;" ><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="#" class="grow" style="color:black;"><i class="fa fa-user-md"></i> User Profile</a>
                    </li>
                    <li>
                        <a href="assignedPatient.htm" class="grow" style="color:black;"><i class="fa fa-user"></i> Patient</a>
                    </li>
                    <li>
                        <a href="hospitalGallery.htm" class="grow" style="color:black;"><i class="fa fa-user"></i> Gallery</a>
                    </li>

                    <li>
                        <a href="doctorDiseases.htm" class="grow" style="color:black;"><i class="fa fa-users"></i> Diseases</a>
                    </li>
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
                        <h1 class="page-header" style="color:black; margin:0px; padding:0px">
                            <strong>Hospital Equipment Gallery</strong> 
                        </h1>
                    </div>
                </div>
                 
                <br>

               
                        <br>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="well">
                                    <figure class="imghvr-zoom-out-flip-horiz">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/1.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-zoom-out-flip-horiz">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/2.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-zoom-out-flip-horiz">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/3.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-shutter-in-out-diag-2">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/4.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-shutter-in-out-diag-2">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/5.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-shutter-in-out-diag-2">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/6.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-zoom-in">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/10.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-zoom-in">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/7.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well">
<figure class="imghvr-zoom-in">
                                        <img class="thumbnail img-responsive"  alt="Bootstrap template" src="resources/GalleryImages/8.jpg" />
                                    <figcaption>Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus.
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus
                                    Lorem ipsum dolor sit amet, et felis suspendisse vestibulum nisl lacus</figcaption>
                                    </figure>                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

</body>

</html>
