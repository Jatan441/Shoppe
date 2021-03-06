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

<link type="text/css" rel="stylesheet" href="css/img.css" />
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
					<a href="Adminhome.html"> <img src="./img/logo.png"
						style="position: relative; left: 45%;">
					</a>
					<!-- /LOGO -->

				</div>

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
							<h3 style="padding-top: 10px;" class="title">Admin Detail
								Update</h3>
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
			<div class="col-md-5 order-details" style="width: 60%; left: 20%;">
				<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #d10024;
	color: white;
	padding-top: 20px;
	padding-bottom: 20px;
}

.link {
	background-color: #66ff33;
	color: white;
	padding: 15px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}
</style>
				<% 
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String cont=request.getParameter("cont");
	String email=request.getParameter("email");
	String add=request.getParameter("add");
	String img=request.getParameter("img");
	String pwd=request.getParameter("pwd");
	%>
				<form action="Aupdate" method="post">
					<table align="center">
						<tr>
						<center>
						<div id="profile-container">
						   <image id="profileImage" src="./ProfilePictures/<%=img%>" />
						</div>
						<input id="imageUpload" type="file" name="img" value="Photo">
						</center>
						</tr>
						<tr>
							<th>FIRST NAME</th>
							<td><%=fname %><input type="hidden" name="fname"
								value="<%= fname %>" /></td>
						</tr>

						<tr>
							<th>LAST NAME</th>
							<td><input type="text" name="lname" value="<%=lname%>" /></td>
						</tr>
						<tr>
							<th>CONTACT</th>
							<td><input type="number" name="cont" value="<%=cont%>" /></td>
						</tr>
						<tr>
						<tr>
							<th>EMAIL</th>
							<td><input type="email" name="email" value="<%=email%>" /></td>
						</tr>
						<tr>
							<th>ADDRESS</th>
							<td><input type="text" name="add" value="<%=add%>" /></td>
						</tr>

						<tr>
							<th>PASSWORD</th>
							<td><input type="password" name="pwd" value="<%=pwd%>" /></td>
						</tr>
						</table>
						<br>
						<center>
						<input type="submit" class="primary-btn " value="SAVE">
						</center>
				</form>

			</div>
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
	<script src="js/img.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
</body>
</html>


