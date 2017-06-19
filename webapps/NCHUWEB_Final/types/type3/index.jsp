<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@include file="../../layout/accessDB.jsp" %>


<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>生活電商xNCHU</title>
		<meta name="description" content="Simple Multi-Item Slider: Category slider with CSS animations" />
		<meta name="keywords" content="jquery plugin, item slider, categories, apple slider, css animation" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<script src="js/modernizr.custom.63321.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


    <link href="./css/bootstrap.css" rel="stylesheet">

    <script src="./js/jquery.js" charset="utf-8"></script>
    <script src="./js/bootstrap.js" charset="utf-8"></script>
	</head>
	<body >
		<div class="container">
			<!-- Codrops top bar -->

		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="../../index.jsp">生活電商</a>
		    </div>

		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li><a href="http://www.nchu.edu.tw/index1.php">NCHU</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Category <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="#">Shoes</a></li>
		            <li><a href="#">Accessories</a></li>
		            <li><a href="#">Watches</a></li>
		            <li><a href="#">Bags</a></li>
		            <li class="divider"></li>
		            <li><a href="#">View All</a></li>
		          </ul>
		        </li>
		      </ul>
		      <form class="navbar-form navbar-left" role="search">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search">
		        </div>
		        <button type="submit" class="btn btn-default">Submit</button>
		      </form>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="../../index.jsp"><i class="material-icons">home</i></a></li>
		      </ul>
		    </div>
		  </div>
		</nav>




			<header class="clearfix">
				<h1>生活電商xNCHU<span>An introduction website</span></h1>
			</header>
			<div class="main">
				<div id="mi-slider" class="mi-slider">
					<ul>
						<li><a href="#"><img src="images/1.jpg" alt="img01"><h4>Boots</h4></a></li>
						<li><a href="#"><img src="images/2.jpg" alt="img02"><h4>Oxfords</h4></a></li>
						<li><a href="#"><img src="images/3.jpg" alt="img03"><h4>Loafers</h4></a></li>
						<li><a href="#"><img src="images/4.jpg" alt="img04"><h4>Sneakers</h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><img src="images/5.jpg" alt="img05"><h4>Belts</h4></a></li>
						<li><a href="#"><img src="images/6.jpg" alt="img06"><h4>Hats &amp; Caps</h4></a></li>
						<li><a href="#"><img src="images/7.jpg" alt="img07"><h4>Sunglasses</h4></a></li>
						<li><a href="#"><img src="images/8.jpg" alt="img08"><h4>Scarves</h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><img src="images/9.jpg" alt="img09"><h4>Casual</h4></a></li>
						<li><a href="#"><img src="images/10.jpg" alt="img10"><h4>Luxury</h4></a></li>
						<li><a href="#"><img src="images/11.jpg" alt="img11"><h4>Sport</h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><img src="images/12.jpg" alt="img12"><h4>Carry-Ons</h4></a></li>
						<li><a href="#"><img src="images/13.jpg" alt="img13"><h4>Duffel Bags</h4></a></li>
						<li><a href="#"><img src="images/14.jpg" alt="img14"><h4>Laptop Bags</h4></a></li>
						<li><a href="#"><img src="images/15.jpg" alt="img15"><h4>Briefcases</h4></a></li>
					</ul>
					<nav>
						<a href="#">Shoes</a>
						<a href="#">Accessories</a>
						<a href="#">Watches</a>
						<a href="#">Bags</a>
					</nav>
				</div>
			</div>

		<div class="row">

			<div class="col-md-3">
			  <div class="card horizontal">
			    <div class="card-image">
			      <img src="http://i.imgur.com/uPOvrN7.jpg" width="150px" height="150px">
			    </div>
			    <div class="card-stacked">
			      <div class="card-content">
			        <p>I am a very simple card. I am good at containing small bits of information.</p>
			      </div>
			      <div class="card-action">
							<a href="#" class="btn btn-success">點我購買</a>
			      </div>
			    </div>
			  </div>
			</div>



			<div class="col-md-3">
			  <div class="card horizontal">
			    <div class="card-image">
			      <img src="images/15.jpg" width="150px" height="150px">
			    </div>
			    <div class="card-stacked">
			      <div class="card-content">
			        <p>I am a very simple card. I am good at containing small bits of information.</p>
			      </div>
			      <div class="card-action">
							<a href="#" class="btn btn-success">點我購買</a>
			      </div>
			    </div>
			  </div>
			</div>


			<div class="col-md-3">
			  <div class="card horizontal">
			    <div class="card-image">
			      <img src="images/14.jpg" width="150px" height="150px">
			    </div>
			    <div class="card-stacked">
			      <div class="card-content">
			        <p>I am a very simple card. I am good at containing small bits of information.</p>
			      </div>
			      <div class="card-action">
							<a href="#" class="btn btn-success">點我購買</a>
			      </div>
			    </div>
			  </div>
			</div>


			<div class="col-md-3">
			  <div class="card horizontal">
			    <div class="card-image">
			      <img src="images/13.jpg" width="150px" height="150px">
			    </div>
			    <div class="card-stacked">
			      <div class="card-content">
			        <p>I am a very simple card. I am good at containing small bits of information.</p>
			      </div>
			      <div class="card-action">
							<a href="#" class="btn btn-success">點我購買</a>
			      </div>
			    </div>
			  </div>
			</div>

			</div>

		</div><!-- /container -->



		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="js/jquery.catslider.js"></script>
		<script>
			$(function() {
				$( '#mi-slider' ).catslider();

			});
		</script>
<div style="margin-top:10%">
<br/>
</div>
	</body>
</html>
