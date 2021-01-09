<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Ironheart</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container"></div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->

					<div class="col-md-12">
						<div class="">
							<a href="" class="logo "> <img src="./img/logo.png"
								style="display: block; margin-right: auto; margin-left: auto">
							</a>
						</div>
					</div>

					<!-- /LOGO -->



					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->



	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="">
					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 style="padding-top: 10px;" class="title">Sign In</h3>
						</div>
					</div>
				</ul>

				<!-- /NAV -->
			</div>

			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->




	<!-- Section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<%
				if (session.getAttribute("msg1") != null) {
			%>
			<span><%=session.getAttribute("msg1")%></span>
			<%
				} else
			%>

			<br>
			<div class="col-md-5 order-details"
				style="position: relative; width: 40%; text-align: center; left: 30%;">
				<!-- Billing Details -->
				<div class="">
					<div class="section-title">
						<h4 class="title">Enter User ID & Password</h4>
					</div>

					<form action="Ulogin" method="post">

						<div class="form-group">
							<input class="input" type="email" name="email"
								placeholder="Enter your ID" required="required">
						</div>
						<div class="form-group">
						<input  id="password-field" type="password" class="form-control" name="pwd" 
						placeholder="Enter your password" required="required" >
              <span style="right: 20px;" toggle="#password-field" class=" fa fa fa-eye field-icon toggle-password"></span>
						</div>
						<br>
							<div class="input-checkbox">
						<input type="checkbox" id="terms" required="required"> <label for="terms">
							<span></span> I've read and accept the <a href="TermAndConditions.html"
							style="color: blue;">terms & conditions</a>
						</label>
						</div>
						<br> <a href="Uregs.html" style="color: black; float: left;">Create
							New ?</a> <a href="Uforgotpass.jsp"
							style="color: black; float: right;">Forgot Password</a> <br>
						<br>
						<div>
							<input style="" type="submit" class="primary-btn " value="SUBMIT">
						</div>
					</form>
				</div>
			</div>
			<!-- /Billing Details -->


		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
	</div>
	<!-- /SECTION -->



	</div>
	<!-- /row -->


	</div>
	<!-- /container -->


	</div>
	<!-- /Section -->

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	</div>
	<!-- /NEWSLETTER -->


	<!-- FOOTER -->
	<footer id="footer">
		<!-- top footer -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row"></div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->

		<!-- bottom footer -->

	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/img.js"></script>

</body>
</html>















