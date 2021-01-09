
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

							<a href="Adminhome.html"><img src="./img/logo.png"
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
							<h3 style="padding-top: 10px;" class="title">Update product</h3>
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

			<style>
table {
	border-collapse: collapse;
}

th, td {
	text-align: center;
	padding: 8px;
}

tr {
	background-color: #f2f2f2;
}

th {
	background-color: #d10024;
	color: #f2f2f2;
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>


			<%
		String name=request.getParameter("name");
		String sno=request.getParameter("sno");
		String price=request.getParameter("price");
		String oldprice=request.getParameter("oldprice");
		String cat=request.getParameter("cat");
		String cmp=request.getParameter("cmp");
		String img1=request.getParameter("img1");
		String img2=request.getParameter("img2");
		String img3=request.getParameter("img3");
		String img4=request.getParameter("img4");
		String status=request.getParameter("status");
		String detail=request.getParameter("detail");
		%>


			<form action=" Updatepro" method="post">
				<table align="center">
				<input type="hidden" name="sno" value="<%= sno %>" />
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name"
							value="<%= name %>" /></td>
					</tr>

					<tr>
						<th>PRICE</th>
						<td><input type="number" name="price" value="<%=price%>" /></td>
					</tr>
					<tr>
						<th>OLDPRICE</th>
						<td><input type="number" name="oldprice"
							value="<%=oldprice%>" /></td>
					</tr>
					<tr>
					<tr>
						<th>CATEGORY</th>
						<td><input type="text" name="cat" value="<%=cat%>" /></td>
					</tr>
					<tr>
						<th>COMPANY</th>
						<td><input type="text" name="cmp" value="<%=cmp%>" /></td>
					</tr>
					<tr>
						<th>STATUS</th>
						<td><select name="status">
						<option>In Stock</option>
						<option>Out of Stock</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>Decription</th>
						<td><input style=" height:50px;" type="text"  name="detail" value="<%=detail%>"/></td>
					</tr>
					<tr>
						<th>Image 1</th>
						<td><input type="file" name="img1" value="<%=img1%>"></td>
					</tr>
					<tr>
						<th>Image 2</th>
						<td><input type="file" name="img2" value="<%=img2%>"></td>
					</tr>
					<tr>
						<th>Image 3</th>
						<td><input type="file" name="img3" value="<%=img3%>"></td>
					</tr>
					<tr>
						<th>Image 4</th>
						<td><input type="file" name="img4" value="<%=img4%>"></td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" class="primary-btn " value="UPDATE">
						</td>

					</tr>
				</table>
			</form>

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
