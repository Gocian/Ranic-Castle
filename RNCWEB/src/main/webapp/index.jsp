<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<%
Connection conn=null;
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:rncdb";

Boolean connect=false;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, "gocian", "1234");
	
	connect=true;
	
}catch(Exception e){
	connect=false;
	e.printStackTrace();
	
	conn.close();
}
%>    

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with Team RNC.">
    <meta name="author" content="Gocian">
    <title>TEAM RNC | FMC</title>

    <!-- font icons -->
    <link rel="stylesheet" href="assets/vendors/themify-icons/css/themify-icons.css">

    <!-- Bootstrap + Creative Studio main styles -->
	<link rel="stylesheet" href="assets/css/creative-studio.css">

    <style>
        .blog-section {
            /* Add your existing styles for the blog section */
        }
        .like-button {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .like-button:hover {
            background-color: #0056b3;
        }
        .like-count {
            margin-top: 10px;
            font-size: 18px;
            color: #333;
        }
    </style>
    
    <script>
        function incrementLike() {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "./like.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                	const responseText = xhr.responseText.trim(); // ���信�� ���� ����
                    document.getElementById('likeCount').innerText = responseText;
                }
            };
            xhr.send();
        }
    </script>

</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
    
    <!-- Page Navigation -->
    <nav class="navbar custom-navbar navbar-expand-lg navbar-dark" data-spy="affix" data-offset-top="20">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="assets/imgs/logo.png" >
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#service">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#portfolio">Portfolio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#team">Team</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#testimonial">Testimonial</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#blog">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-primary btn-sm ml-lg-3" href="components.html">Components</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Of Page Navigation -->

    <!-- Page Header -->
    <header class="header">
        <div class="overlay">
            <h6 class="subtitle">We Redefine The Masterpiece</h6>
            <h1 class="title">TEAM RNC</h1>
            <div class="buttons text-center">
                <a href="#service" class="btn btn-primary rounded w-lg btn-lg my-1">Our Service</a>
                <a href="#contact" class="btn btn-outline-light rounded w-lg btn-lg my-1">Contact Us</a>
            </div>              
        </div>      
    </header>
    <!-- End Of Page Header -->

    <!-- Box -->
    <div class="box text-center">
        <div class="box-item">
            <i class="ti-vector"></i>
            <h6 class="box-title">Design</h6>
            <p>Design your custom website with Castle-Hun the project manager.</p>
        </div>
        <div class="box-item">
            <i class="ti-filter"></i>
            <h6 class="box-title">Development</h6>
            <p>Our team has the best developers. Any feature you want will be realized.</p>
        </div>
        <div class="box-item">
            <i class="ti-mobile"></i>
            <h6 class="box-title">Business</h6>
            <p>No money? Contact director Namjung. You will definitely be satisfied.</p>
        </div>
    </div>
    <!-- End of Box -->
    
    <!-- Button -->
    <div class="buttons text-center">
    	<button class="btn2 btn-primary rounded w-lg btn-lg my-1" onclick="incrementLike()">Like</button>
    	<div class="like-count" id="likeCount">
    		<%
            Statement stmt = null;
            ResultSet rs = null;
            int likeCount = 0;

            try {
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT CNT FROM CNT WHERE SEQ = 1");

                if (rs.next()) {
                    likeCount = rs.getInt("CNT");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }

            out.print(likeCount);
            %>
    	</div>
    </div>
    <!-- End of Button -->
    
    

    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-5 col-lg-4">
                    <img src="assets/imgs/1-15.png" >
                </div>
                <div class="col-md-7 col-lg-8">
                    <h6 class="section-subtitle mb-0">We Create Only</h6>
                    <h6 class="section-title mb-3">Masterpieces</h6>
                    <p>We specialize in developing websites that perfectly match our clients' needs, delivering exceptional results with top-notch expertise.</p>
                    <p>We have participated in government-funded projects and have even won awards for our work. As time goes by, we continue to grow and improve, aiming to expand beyond a team into a fully-fledged corporation. </p>
                    <p>Our developers are among the best in the industry, ensuring that any feature you desire can be implemented seamlessly.</p>
                    <p>We take pride in our ability to combine technical excellence with customer satisfaction.</p>
                    <p>Trust us to bring your vision to life with unparalleled professionalism and skill.</p>
                </div>
            </div>
        </div>
    </section>
    <!-- End of About Section -->

    <!-- About Section with bg -->
    <section class="has-bg-img py-md">
        <div class="container text-center">
            <h6 class="section-subtitle">We Find</h6>
            <h6 class="section-title mb-6">What You Want.</h6>
            <div class="widget mb-4">
                <div class="widget-item">
                    <i class="ti-notepad"></i>
                    <h4>Sales</h4>
                </div>
                <div class="widget-item">
                    <i class="ti-layout"></i>
                    <h4>Consulting</h4>
                </div>
                <div class="widget-item">
                    <i class="ti-filter"></i>
                    <h4>Develope</h4>
                </div>
                <div class="widget-item">
                    <i class="ti-thumb-up"></i>
                    <h4>Provide</h4>
                </div>
            </div>
        </div>
    </section>
    <!-- End Of About Sectoin -->

    <!-- Service Section 
    <section id="service">
        <div class="container">
            <h6 class="section-subtitle text-center">Makes Happen</h6>
            <h5 class="section-title text-center mb-6">Our Service</h5> 
            <div class="row">
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-filter text-primary"></i></h2>
                            <h6 class="card-title">corporis assumenda</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-paint-roller text-primary"></i></h2>
                            <h6 class="card-title">Debitis amet</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-ruler-pencil text-primary"></i></h2>
                            <h6 class="card-title">Libero temporibus</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-layers text-primary"></i></h2>
                            <h6 class="card-title">Perspiciatis explicabo</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-bolt text-primary"></i></h2>
                            <h6 class="card-title">Poluptatum</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-palette text-primary"></i></h2>
                            <h6 class="card-title">Nihil dicta</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-stats-up text-primary"></i></h2>
                            <h6 class="card-title">Repellendus maxime</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="mb-4"><i class="ti-location-arrow text-primary"></i></h2>
                            <h6 class="card-title">Sint vitae</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis amet saepe et!</p>
                        </div>
                    </div>
                </div>

            </div>  
        </div>
    </section>
     End of Service Section -->

    <!-- Portfolio section 
    <section id="portfolio">
        <div class="container text-center">
            <h6 class="section-subtitle">Our Awesome Works</h6>
            <h6 class="section-title mb-5">Our Portfolio</h6>
            <div class="row">
                <div class="col-sm-4">
                    <div class="img-wrapper">
                        <img src="assets/imgs/folio-1.jpg" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                        <div class="overlay">
                            <div class="overlay-infos">
                                <h5>Project Title</h5>
                                <a href="javascript:void(0)"><i class="ti-zoom-in"></i></a>
                                <a href="javascript:void(0)"><i class="ti-link"></i></a>
                            </div>  
                        </div>
                    </div>
                    <div class="img-wrapper">
                        <img src="assets/imgs/folio-2.jpg" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                        <div class="overlay">
                            <div class="overlay-infos">
                                <h5>Project Title</h5>
                                <a href="javascript:void(0)"><i class="ti-zoom-in"></i></a>
                                <a href="javascript:void(0)"><i class="ti-link"></i></a>
                            </div>                              
                        </div>
                    </div>                  
                </div>
                <div class="col-sm-4">
                    <div class="img-wrapper">
                        <img src="assets/imgs/folio-3.jpg" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                        <div class="overlay">
                            <div class="overlay-infos">
                                <h5>Project Title</h5>
                                <a href="javascript:void(0)"><i class="ti-zoom-in"></i></a>
                                <a href="javascript:void(0)"><i class="ti-link"></i></a>
                            </div>  
                        </div>
                    </div>
                    <div class="img-wrapper">
                        <img src="assets/imgs/folio-4.jpg" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                        <div class="overlay">
                            <div class="overlay-infos">
                                <h5>Project Title</h5>
                                <a href="javascript:void(0)"><i class="ti-zoom-in"></i></a>
                                <a href="javascript:void(0)"><i class="ti-link"></i></a>
                            </div>                              
                        </div>
                    </div>                  
                </div>
                <div class="col-sm-4">
                    <div class="img-wrapper">
                        <img src="assets/imgs/folio-5.jpg" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                        <div class="overlay">
                            <div class="overlay-infos">
                                <h5>Project Title</h5>
                                <a href="javascript:void(0)"><i class="ti-zoom-in"></i></a>
                                <a href="javascript:void(0)"><i class="ti-link"></i></a>
                            </div>  
                        </div>
                    </div>
                    <div class="img-wrapper">
                        <img src="assets/imgs/folio-6.jpg" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                        <div class="overlay">
                            <div class="overlay-infos">
                                <h5>Project Title</h5>
                                <a href="javascript:void(0)"><i class="ti-zoom-in"></i></a>
                                <a href="javascript:void(0)"><i class="ti-link"></i></a>
                            </div>                              
                        </div>
                    </div>                  
                </div>
            </div>
        </div>
    </section>
     End of portfolio section -->

    <!-- Team Section -->
    <section id="team">
        <div class="container">
            <h6 class="section-subtitle text-center">Meet With</h6>
            <h6 class="section-title mb-5 text-center">Our Members</h6>
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="card text-center mb-4">
                        <img class="card-img-top inset" src="assets/imgs/avatar_logo.png">
                        <div class="card-body">
                            <h6 class="small text-primary font-weight-bold">Project Manager</h6>
                            <h5 class="card-title">Castle Hun</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni quos esse tenetur illo qui, nostrum.</p>
                            <div class="socials">
                                <a href="javascript:void(0)"><i class="ti-facebook"></i> </a>
                                <a href="javascript:void(0)"><i class="ti-github"></i></a>
                                <a href="javascript:void(0)"><i class="ti-dropbox"></i></a>
                                <a href="javascript:void(0)"><i class="ti-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="card text-center mb-4">
                        <img class="card-img-top inset" src="assets/imgs/avatar_logo.png">
                        <div class="card-body">
                            <h6 class="small text-primary font-weight-bold">Director</h6>
                            <h5 class="card-title">Nam Jung</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni quos esse tenetur illo qui, nostrum.</p>
                            <div class="socials">
                                <a href="javascript:void(0)"><i class="ti-facebook"></i> </a>
                                <a href="javascript:void(0)"><i class="ti-github"></i></a>
                                <a href="javascript:void(0)"><i class="ti-dropbox"></i></a>
                                <a href="javascript:void(0)"><i class="ti-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="card text-center mb-4">
                        <img class="card-img-top inset" src="assets/imgs/avatar_logo.png">
                        <div class="card-body">
                            <h6 class="small text-primary font-weight-bold">General</h6>
                            <h5 class="card-title">Charl</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni quos esse tenetur illo qui, nostrum.</p>
                            <div class="socials">
                                <a href="javascript:void(0)"><i class="ti-facebook"></i> </a>
                                <a href="javascript:void(0)"><i class="ti-github"></i></a>
                                <a href="javascript:void(0)"><i class="ti-dropbox"></i></a>
                                <a href="javascript:void(0)"><i class="ti-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="card text-center mb-4">
                        <img class="card-img-top inset" src="assets/imgs/avatar_logo.png">
                        <div class="card-body">
                            <h6 class="small text-primary font-weight-bold">Intern</h6>
                            <h5 class="card-title">Cian Go</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni quos esse tenetur illo qui, nostrum.</p>
                            <div class="socials">
                                <a href="javascript:void(0)"><i class="ti-facebook"></i> </a>
                                <a href="javascript:void(0)"><i class="ti-github"></i></a>
                                <a href="javascript:void(0)"><i class="ti-dropbox"></i></a>
                                <a href="javascript:void(0)"><i class="ti-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="card text-center mb-4">
                        <img class="card-img-top inset" src="assets/imgs/avatar_logo.png">
                        <div class="card-body">
                            <h6 class="small text-primary font-weight-bold">Designer</h6>
                            <h5 class="card-title">John</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni quos esse tenetur illo qui, nostrum.</p>
                            <div class="socials">
                                <a href="javascript:void(0)"><i class="ti-facebook"></i> </a>
                                <a href="javascript:void(0)"><i class="ti-github"></i></a>
                                <a href="javascript:void(0)"><i class="ti-dropbox"></i></a>
                                <a href="javascript:void(0)"><i class="ti-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="card text-center mb-4">
                        <img class="card-img-top inset" src="assets/imgs/TEAMRNC.png">
                        <div class="card-body">
                            <h6 class="small text-primary font-weight-bold">Broker</h6>
                            <h5 class="card-title">Amy</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni quos esse tenetur illo qui, nostrum.</p>
                            <div class="socials">
                                <a href="javascript:void(0)"><i class="ti-facebook"></i> </a>
                                <a href="javascript:void(0)"><i class="ti-github"></i></a>
                                <a href="javascript:void(0)"><i class="ti-dropbox"></i></a>
                                <a href="javascript:void(0)"><i class="ti-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- End of Team Sectoin -->

    <!-- Fatcs Section -->
    <section class="has-bg-img bg-img-2">
        <div class="container text-center">
            <h6 class="section-subtitle">We Are Awesome</h6>
            <h6 class="section-title mb-6">Some Fun Fucts</h6>
                <div class="widget-2">
                    <div class="widget-item">
                        <i class="ti-cup"></i>
                        <h6 class="title">100+</h6>
                        <div class="subtitle">Awards Won</div>
                    </div>
                    <div class="widget-item">
                        <i class="ti-face-smile"></i>
                        <h6 class="title">100+</h6>
                        <div class="subtitle">Happy Clients</div>
                    </div>
                    <div class="widget-item">
                        <i class="ti-blackboard"></i>
                        <h6 class="title">845+</h6>
                        <div class="subtitle">Project Completed</div>
                    </div>
                    <div class="widget-item">
                        <i class="ti-comments-smiley"></i>
                        <h6 class="title">15K+</h6>
                        <div class="subtitle">Comments</div>
                    </div>
                </div>
        </div>
    </section>

    <!-- Testimonial Section -->
    <section id="testimonial">
        <div class="container">
            <h6 class="section-subtitle text-center">Testimonial</h6>
            <h6 class="section-title text-center mb-6">What Our Clients Says</h6>
            <div class="row">
                <div class="col-md-6">
                    <div class="testimonial-wrapper">
                        <div class="img-holder">
                            <img src="assets/imgs/avatar_logo.png" >                     
                        </div>
                        <div class="body">
                            <p class="subtitle">'��'</p>
                            <h6 class="title">Cheolsu Kim</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="testimonial-wrapper">
                        <div class="img-holder">
                            <img src="assets/imgs/avatar_logo.png" >                     
                        </div>
                        <div class="body">
                            <p class="subtitle">Earn Your Keep.</p>
                            <h6 class="title">Cheonjung Kim</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End of Testimonial Section -->

    <!-- Video Section -->
    <section class="has-bg-img py-lg">
        <div class="container text-center">

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-outline-primary play-control" data-toggle="modal" data-target="#exampleModalCenter">
              <i class="ti-control-play" ></i>
            </button>
            <h6 class="section-title mt-4">RNC Youtube</h6>

        </div>
    </section>
    <!-- End of Video Section -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <iframe width="100%" height="475" src="https://youtu.be/LDU_Txk06tM?si=pZoVaMAdYsC7gbzr" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
    <!-- end of modal -->

    <!-- Blog Section -->
    <section id="blog">
        <div class="container">
            <h6 class="section-subtitle text-center">News Feeds</h6>
            <h6 class="section-title mb-6 text-center">Our Blog</h6>

            <div class="row">
                <div class="col-md-4">
                    <div class="card blog-post my-4 my-sm-5 my-md-0">
                        <img src="./assets/imgs/blog-1.jpg">
                        <div class="card-body">
                            <div class="details mb-3">
                                <a href="javascript:void(0)"><i class="ti-comments"></i> 123</a>
                                <a href="javascript:void(0)"><i class="ti-eye"></i> 123</a>
                            </div>
                            <h5 class="card-title">Beef</h5>
                            <p>The beef is absolutely exquisite. Each bite melts in your mouth with rich, savory flavors that are perfectly balanced. This is truly a gourmet experience that showcases the finest quality of beef.</p>
                            <a href="javascript:void(0)" class="d-block mt-3">Read More...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card blog-post my-4 my-sm-5 my-md-0">
                        <img src="./assets/imgs/blog-2.jpg">
                        <div class="card-body">
                            <div class="details mb-3">
                                <a href="javascript:void(0)"><i class="ti-comments"></i> 434</a>
                                <a href="javascript:void(0)"><i class="ti-eye"></i> 987</a>
                            </div>
                            <h5 class="card-title">Pork</h5>
                            <p>The pork is simply outstanding. Its succulent texture and depth of flavor are unparalleled, making each bite a delight. This dish exemplifies the pinnacle of culinary craftsmanship with pork.</p>
                            <a href="javascript:void(0)" class="d-block mt-3">Read More...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card blog-post my-4 my-sm-5 my-md-0">
                        <img src="assets/imgs/blog-3.jpg" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                        <div class="card-body">
                            <div class="details mb-3">
                                <a href="javascript:void(0)"><i class="ti-comments"></i> 164</a>
                                <a href="javascript:void(0)"><i class="ti-eye"></i> 425</a>
                            </div>
                            <h5 class="card-title">Job</h5>
                            <p>Working in FMC is so exhausting. The constant pressure and endless deadlines make it hard to enjoy the job. Some days, it feels like the stress never ends.</p>
                            <a href="javascript:void(0)" class="d-block mt-3">Read More...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End of Blog Section -->

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="contact-card">
                <div class="infos">
                    <h6 class="section-subtitle">Get Here</h6>
                    <h6 class="section-title mb-4">Contact Us</h6>

                    <div class="item">
                        <i class="ti-location-pin"></i>
                        <div class="">
                            <h5>Location</h5>
                            <p> 4 Hoenamu-ro, Yongsan-gu, Seoul</p>
                        </div>                          
                    </div>
                    <div class="item">
                        <i class="ti-mobile"></i>
                        <div>
                            <h5>Phone Number</h5>
                            <p>010-2302-9629</p>
                        </div>                          
                    </div>
                    <div class="item">
                        <i class="ti-email"></i>
                        <div class="mb-0">
                            <h5>Email Address</h5>
                            <p>gocian@ranic.com</p>
                        </div>
                    </div>
                    <div class="item">
                        <i class="ti-world"></i>
                        <div class="mb-0">
                            <h5>ranic.com</h5>
                            <p>gocian@ranic.com</p>
                        </div>
                    </div>
                </div>
                <div class="form">
                    <h6 class="section-subtitle">Available 24/7</h6>
                    <h6 class="section-title mb-4">Get In Touch</h6>
                    <form>
                        <div class="form-group">
                            <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password" required>
                        </div>
                        <div class="form-group">
                            <textarea name="contact-message" id="" cols="30" rows="7" class="form-control form-control-lg" placeholder="Message"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block btn-lg mt-3">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section -->

    <section class="has-bg-img py-0">
        <div class="container">
            <div class="footer">
                <div class="footer-lists">
                    <ul class="list">
                        <li class="list-head">
                            <h6 class="font-weight-bold">ABOUT US</h6>
                        </li>
                        <li class="list-body">
                            <a href="#" class="logo">
                                <img src="assets/imgs/logo.png" alt="Download free bootstrap 4 landing page, free boootstrap 4 templates, Download free bootstrap 4.1 landing page, free boootstrap 4.1.1 templates, Creative studio Landing page">
                                <h6>TEAM RNC</h6>
                            </a>
                            <p>Alcohol</p> 
                            <p class="mt-3">
                                Copyright <script>document.write(new Date().getFullYear())</script> &copy; <a class="d-inline text-primary" href="http://www.google.com">RNC</a>
                            </p>                   
                        </li>
                    </ul>
                    <ul class="list">
                        <li class="list-head">
                            <h6 class="font-weight-bold">USEFUL LINKS</h6>
                        </li>
                        <li class="list-body">
                            <div class="row">
                                <div class="col">
                                    <a href="#about">About</a>
                                    <a href="#service">Service</a>
                                    <a href="#portfolio">Portfolio</a>
                                    <a href="#testmonail">Testimonial</a>
                                </div>
                                <div class="col">
                                    <a href="#team">Team</a>
                                    <a href="#blog">Blog</a>
                                    <a href="#">Faq</a>
                                    <a href="#">Privacy Policy</a>                  
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul class="list">
                        <li class="list-head">
                            <h6 class="font-weight-bold">CONTACT INFO</h6>
                        </li>
                        <li class="list-body">
                            <p>Contact us and we'll get back to you within 24 hours.</p>
                            <p><i class="ti-location-pin"></i> 4 Hoenamu-ro, Yongsan-gu, Seoul</p>
                            <p><i class="ti-email"></i>  gocian@ranic.com</p>
                            <div class="social-links">
                                <a href="javascript:void(0)" class="link"><i class="ti-facebook"></i></a>
                                <a href="javascript:void(0)" class="link"><i class="ti-twitter-alt"></i></a>
                                <a href="javascript:void(0)" class="link"><i class="ti-google"></i></a>
                                <a href="javascript:void(0)" class="link"><i class="ti-pinterest-alt"></i></a>
                                <a href="javascript:void(0)" class="link"><i class="ti-instagram"></i></a>
                                <a href="javascript:void(0)" class="link"><i class="ti-rss"></i></a>
                            </div>
                            <%if(connect==true){%>
                            	DB Connected
                            <%}else{ %>
                                DB Failed
                            <%} %>
                        </li>
                    </ul>
                </div>
            </div>    
        </div>
    </section>
    


    <!-- core  -->
    <script src="assets/vendors/jquery/jquery-3.4.1.js"></script>
    <script src="assets/vendors/bootstrap/bootstrap.bundle.js"></script>

    <!-- bootstrap affix -->
    <script src="assets/vendors/bootstrap/bootstrap.affix.js"></script>

    <!-- Creative Studio js -->
    <script src="assets/js/creative-studio.js"></script>

</body>
</html>
