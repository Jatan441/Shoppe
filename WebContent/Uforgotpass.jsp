

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
			<div class="container">
				
			</div>
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
						<div >
						<a href="Ulogin.jsp">
							<img src="./img/logo.png"
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







	<!-- Section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- SECTION -->
				<div class="section">
					<!-- container -->
					<div class="container">
					<%
				if (session.getAttribute("msg2") != null) {
			%>
			<span><%=session.getAttribute("msg2")%></span>
			<%
				} else
			%>

			<br>
						<!-- row -->
						<div class="row">

							<div class="col-md-5 order-details"
								style="width: 40%; text-align: center; left: 30%;">
								<!-- Billing Details -->
								<div class="">
									<div class="section-title">
										<h4 class="title">Enter User ID</h4>
									</div>

									<form action="Uforgotpass" method="post">
										<div class="form-group">
											<input class="input" type="email" name="email"
												placeholder="Enter your ID" required="required">
										</div>

										<br> <a href="Aregs.html" style="color: black;">Create
											New ?</a> <br>
										<br>
										<div>
											<input style="" type="submit" class="primary-btn" value="SUBMIT">
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
	<script src=""></script>

</body>
</html>







