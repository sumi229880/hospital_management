<!DOCTYPE html>
<html>

<head>
    <title>We Care</title>
<!--    <link rel="stylesheet" href="css/imagehover.min.css">-->
    <link rel="stylesheet" href="resources/d.css">
    <link rel="stylesheet" href="resources/testcss.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">


    <style type="text/css">
        .navbar-default .navbar-nav > li > a:hover,
        .navbar-default .navbar-nav > li > a:focus {
            background-color: rgba(0, 120, 255, 0.5);
            color: white;
            border-radius: 22px;
        }
        
        body {
           
            background-repeat: no-repeat;
            background-color: black;
            color: cornflowerblue;
        }
    </style>
</head>

<body>



    <div id="outer">
        <!-- navbar starts-->
        <nav class="navbar navbar-default navbar-fixed-top" style=" background-color: rgba(0, 120, 255, 0.3); color: white;">
            <div class="container">
                <div class="col-md-12">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><img src="resources/img/logo.png" class="img-responsive" style="width: 3em; margin-left: -10px; margin-top: -16px;"></a>
                    </div>
                    <div class="collapse navbar-collapse navbar-right" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class=""><a href="#" style="color:#fff">Home</a></li>
                            <li class=""><a href="#service" style="color:#fff">Services</a></li>
                            <li class=""><a href="#contact" style="color:#fff">Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:white"><b>Login</b> <span class="caret"></span></a>
                                <ul id="login-dp" class="dropdown-menu">
                                    <li>
                                        <div class="row">
                                            <div class="col-md-12">
                                                Login Credentials
                                                <form class="form" role="form" method="post" action='login.htm' accept-charset="UTF-8" id="login-nav">
                                                    <div class="form-group">
                                                        <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email address" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                                        <div class="help-block text-right"><a href="" style="color:white">Forget the password ?</a></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-primary btn-block" style="background-color:#05006a">Sign in</button>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                             ${error}
                                                        </label>
                                                        
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="bottom text-center">
                                                New here ? <a href="redirectRegister.htm" style="color:white"><b>Join Us</b></a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- navbar ends-->
        <div class="background-wrap">
            <div id="video-div">
                <video id="video-bg-elem" preload="auto" autoplay="true" loop="loop" muted="muted">
                    <source src="resources/video/beat.mp4" type="video/mp4"> Video not supported
                </video>
            </div>
            <div id="landing-text">
                <h1 id="neon-text">&nbsp;Hands For Health And Wellness</h1>
                <h3 style="text-align:center;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do tempor incididunt.</h3>
            </div>
        </div>
    </div>

    <div id="bottom-box">

        <!--Services-->
        <div style="margin: 3% 0%;">
            <section id="service" class="section-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <h2 class="ser-title">Our Service</h2>
                            <hr class="botm-line" style="border-style: ridge; border-width: 2px; border-color:cornflowerblue; background-color:cornflowerblue; color:cornflowerblue;">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris cillum.</p>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="service-info">
                                <div class="icon">
                                    <h2 id="serv-a"><i  class="fa fa-stethoscope"></i></h2>
                                </div>
                                <div id="service-a" class="icon-info">
                                    <h4>24 Hour Support</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                            <div class="service-info">
                                <div class="icon">
                                    <h2><i class="fa fa-ambulance"></i></h2>
                                </div>
                                <div id="service-b" class="icon-info">
                                    <h4>Emergency Services</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="service-info">
                                <div class="icon">
                                    <h2><i class="fa fa-user-md"></i></h2>
                                </div>
                                <div id="service-c" class="icon-info">
                                    <h4>Medical Counseling</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                            <div class="service-info">
                                <div class="icon">
                                    <h2><i class="fa fa-medkit"></i></h2>
                                </div>
                                <div id="service-d" class="icon-info">
                                    <h4>Premium Healthcare</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!--Services-->

        <!--cta 2-->
        <section id="cta-2" class="section-padding">
            <div class="container">
                <h2>Follow us on Twitter &nbsp;<span><i id = "twitter-logo" class="fa fa-twitter"></i></span></h2>
                <hr class="botm-line" style="border-style: ridge; border-width: 2px; border-color:cornflowerblue; background-color:cornflowerblue; color:cornflowerblue;">
                <div class="col-md-6" style="float:right;">
                    <a class="twitter-timeline" href="https://twitter.com/hashtag/Health" data-widget-id="851837081102016516">#Health Tweets</a>
                    <script>
                        ! function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0],
                                p = /^http:/.test(d.location) ? 'http' : 'https';
                            if (!d.getElementById(id)) {
                                js = d.createElement(s);
                                js.id = id;
                                js.src = p + "://platform.twitter.com/widgets.js";
                                fjs.parentNode.insertBefore(js, fjs);
                            }
                        }(document, "script", "twitter-wjs");
                    </script>
                </div>
                <div class="col-md-6">

                    <p style=" text-align: justify;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
                    <p style=" text-align: justify;">Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.</p>
                    <p style=" text-align: justify;">Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue.Aenean imperdiet. Etiam ultricies nisi vel augue.</p>
                </div>

            </div>
        </section>
        <!--cta-->


        <!--contact-->
        <section id="contact" class="section-padding" style="margin: 3% 0%;">

            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="ser-title">Contact us &nbsp; <span><i id = "contact-logo" class="fa fa-address-card"></i></span></h2>
                        <hr class="botm-line" style="border-style: ridge; border-width: 2px; border-color:cornflowerblue; background-color:cornflowerblue; color:cornflowerblue;">
                    </div>
                    <div class="col-md-4 col-sm-4" style="margin-top:1.7em">
                        <img src="resources/img/sticky3.png" id="sticky" alt="Smiley face" height="80%" width="80%">
                    </div>
                    <div class="col-md-8 col-sm-8 marb20">
                        <div class="contact-info">
                            <h3 class="cnt-ttl">Book an appointment</h3>
                            <div class="space"></div>
                            <div id="sendmessage"></div>
                            <div id="errormessage"></div>
                            <form action="" method="post" role="form" class="contactForm">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control br-radius-zero" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control br-radius-zero" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <input type="date" class="form-control br-radius-zero" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control br-radius-zero" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                                    <div class="validation"></div>
                                </div>

                                <div class="form-action">
                                    <section id="sub-btn">
                                        <div class="button">
                                            <button type="submit" class="btn btn-form" style="border:0px; padding:8%;background-color: transparent;border-radius: .25rem;">APPOINTMENT</button>
                                        </div>
                                        <div class="cover">
                                            <div class="innie"></div>
                                            <div class="spine"></div>
                                            <div class="outie"></div>
                                        </div>
                                        <div class="shadow"></div>
                                    </section>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/ contact-->

        <!--        Google maps-->
        <section id="cta-2" class="section-padding">
            <div class="container">
                <h2>Locate us &nbsp;<span><i id = "google-map" class="fa fa-map-marker"></i></span></h2>
                <hr class="botm-line" style="border-style: ridge; border-width: 2px; border-color:cornflowerblue; background-color:cornflowerblue; color:cornflowerblue;">
                <script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyB9txy7FU3_N9LtfHX23Wnnt8Lrquzy10E&v=3.exp'></script>
                <div style='overflow:hidden;height:100%;width:100%;'>
                    <div id='gmap_canvas' style='height:440px;width:100%; border-radius:1%;'></div>
                    <div><small><a href="https://www.google.com/maps">Google maps</a></small></div>
                    <div><small><a href="https://ultimatewebtraffic.com/"></a></small></div>
                    <style>
                        #gmap_canvas img {
                            max-width: none!important;
                            background: none!important
                        }
                    </style>
                </div>
                <script type='text/javascript'>
                    function init_map() {
                        var myOptions = {
                            zoom: 14,
                            center: new google.maps.LatLng(42.3600825, -71.05888010000001),
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                        marker = new google.maps.Marker({
                            map: map,
                            position: new google.maps.LatLng(42.3600825, -71.05888010000001)
                        });
                        infowindow = new google.maps.InfoWindow({
                            content: '<strong>Wellness Hospital</strong><br>Boston, United States<br>'
                        });
                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, marker);
                        });
                        infowindow.open(map, marker);
                    }
                    google.maps.event.addDomListener(window, 'load', init_map);
                </script>
            </div>
        </section>

        <!--footer-->

        <footer id="footer">

            <hr noshade style="border-style: ridge; border-width: 2px; border-color:cornflowerblue; background-color:cornflowerblue; color:cornflowerblue;">
            <strong><em><h6 align="center" style="align:center; color:cornflowerblue;">&copy; HealthWell.com, Inc. All rights reserved.</h6></em></strong>
            <nav class="menu">
                <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
                <label class="menu-open-button" for="menu-open">
                    <span><h2>&copy;</h2></span>
                    <!--
                    <span class="hamburger hamburger-1"></span>
                    <span class="hamburger hamburger-2"></span>
                    <span class="hamburger hamburger-3"></span>
-->
                </label>

                <a href="frontSettings.htm" class="menu-item"> <i class="fa fa-bar-chart"></i> </a>
                <a href="frontMessage.htm" class="menu-item"> <i class="fa fa-plus"></i> </a>
                <a href="frontHeart.htm" class="menu-item"> <i class="fa fa-heart"></i> </a>
                <a href="frontPlus.htm" class="menu-item"> <i class="fa fa-envelope"></i> </a>
                <a href="frontGraph.htm" class="menu-item"> <i class="fa fa-cog"></i> </a>

            </nav>
            <!--Google maps ends-->

            <!-- filters -->
            <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
                <defs>
                    <filter id="shadowed-goo">

                        <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                        <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                        <feGaussianBlur in="goo" stdDeviation="3" result="shadow" />
                        <feColorMatrix in="shadow" mode="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2" result="shadow" />
                        <feOffset in="shadow" dx="1" dy="1" result="shadow" />
                        <feBlend in2="shadow" in="goo" result="goo" />
                        <feBlend in2="goo" in="SourceGraphic" result="mix" />
                    </filter>
                    <filter id="goo">
                        <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                        <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                        <feBlend in2="goo" in="SourceGraphic" result="mix" />
                    </filter>
                </defs>
            </svg>

        </footer>
        <!--/ footer-->
    </div>

</body>

</html>