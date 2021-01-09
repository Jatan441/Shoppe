<%if(session.getAttribute("restriction") !=null){ %>
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
					<a href="Home.jsp"> <img src="./img/logo.png"
						style="position: relative; left: 42%;">
					</a>
					<!-- /LOGO -->
					<div class="header-ctn">
						<div>
							<a href="Usignout"> <i class=" fa fa-user-o "></i> <span>Sign
									Out</span>
							</a>
						</div>
					</div>

					<div class="header-ctn">
						<div>
							<a href="Ulogout"> <i class=" fa fa-user-o "></i> <span>Log
									Out</span>
							</a>
						</div>
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
							<h3 style="padding-top: 10px;" class="title">My Account</h3>
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

.img {
	border-radius: 60%;
	width: 100px;
}
</style>
				<% 
	String email =(String)session.getAttribute("id");
	String qr="select * from User where email='"+email+"' ";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next())
	{
	%>
				<table>

					<%
	do
	{
		String fname=rs.getString("First_Name");
		String lname=rs.getString("Last_Name");
		String cat=rs.getString("category");
				email=rs.getString("Email");
		String add=rs.getString("Address");
		String city=rs.getString("City");
		String pin=rs.getString("Pin_Code");
		String country=rs.getString("Country");
		String mob=rs.getString("Mobile");
		String pwd=rs.getString("password");
		String img=rs.getString("Image");
		%>

					<tr>
						<center>
							<img class="img" src="./ProfilePictures/<%=img%>">
						</center>
					</tr>
					<tr>
						<th>First Name:</th>
						<td><%=fname %></td>
					</tr>
					<tr>
						<th>Last Name:</th>
						<td><%=lname %></td>
					</tr>
					<tr>
						<th>Category:</th>
						<td><%=cat %></td>
					</tr>
					<tr>
						<th>Email:</th>
						<td><%=email %></td>
					</tr>
					<tr>
						<th>Address:</th>
						<td><%=add %></td>
					</tr>
				
					<tr>
						<th>City:</th>
						<td><%=city %></td>
					</tr>
					<tr>
						<th>Pin Code:</th>
						<td><%=pin %></td>
					</tr>
					<tr>
						<th>Country:</th>
						<td><%=country %></td>
					</tr>
					<tr>
						<th>Mobile:</th>
						<td><%=mob %></td>
					</tr>
					</table>
					<form action="Uupdate.jsp" method="post">
					<input type="hidden" name="fname" value="<%=fname%>">
					<input type="hidden" name="lname" value="<%=lname%>">
					<input type="hidden" name="cat" value="<%=cat%>">
					<input type="hidden" name="mob" value="<%=mob%>">
					<input type="hidden" name="email" value="<%=email%>">
					<input type="hidden" name="pwd" value="<%=pwd%>">
					<input type="hidden" name="add" value="<%=add%>">
					<input type="hidden" name="pin" value="<%=pin%>">
					<input type="hidden" name="city" value="<%=city%>">
					<input type="hidden" name="country" value="<%=country%>">
					<input type="hidden" name="img" value="<%=img%>">
					<br><center>
					<input type="submit"class="primary-btn " value="EDIT">
					</center>
					</form>
					
					<% 
	
	}while(rs.next());
}
else
{
	out.println("no records found");
}
%>
			
			
			
			</div>
			</div>
			</div>
		
	<!-- /Section -->

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<div class="container">
			<div class="row"></div>
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
<%}else response.sendRedirect("Restriction");%>