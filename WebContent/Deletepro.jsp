<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="com.mysql.jdbc.Util"%>
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
		<div id="top-header" style="width: 100%;">
			<div class="container" style="width: 100%;"></div>
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
								style="display: block; margin-right: auto; margin-left: auto"></a>

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
							<h3 style="padding-top: 10px;" class="title">Delete
								product</h3>
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
		<div class="">

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
	background-color: #d10024;
	color: white;
	padding: 15px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}
</style>

	<!-- SEARCH BAR -->
					<div>
					<center>
						<div class="header-search">
							<form action="Deletepro.jsp" method="post">
							<%String name = request.getParameter("name"); %>
							 <input  style=" border-radius:40px 0px 0px 40px; position:relative;  width:50%; height: 40px;margin-right: -4px;"
							  placeholder="Search product here" name="name" value="<%if(name!=null){out.println(name);}%>">
								<button class="search-btn" type="submit">Search</button>
							</form>
						</div>
						</center>
					</div>
					<!-- /SEARCH BAR -->

			<% 	
			if(name!=null)
			{
			String query="select * from products where sale is null and subcategory is null and name like '"+name+"%'";
			
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(query);
				if(rs.next())
				{
				%>
						<table>
							<tr>
				
								<th>NAME</th>
								<th>PRICE</th>
								<th>OLDPRICE</th>
								<th>CATEGORY</th>
								<th>COMPANY</th>
								<th>STATUS</th>
								<th>DESCRIPTION</th>
								<th>IMAGE 1,2</th>
								<th>IMAGE 3,4</th>
								
								<th>DELETE</th>
				
								<%
				do
				{
					 name=rs.getString("name");
					String price=rs.getString("price");
					String oldprice=rs.getString("oldprice");
					String sno=rs.getString("Sno");
					String cat=rs.getString("category");
					String cmp=rs.getString("company");
					String img1=rs.getString("image");
					String img2=rs.getString("image2");
					String img3=rs.getString("image3");
					String img4=rs.getString("image4");
					String status=rs.getString("status");
					String detail=rs.getString("Detail");
					%>
							<tr>
								<td><%=name %></td>
								<td><%=price %></td>
								<td><%=oldprice %></td>
								<td><%=cat %></td>
								<td><%=cmp %></td>
								<td><%=status %></td>
								<td><html><textarea rows="4" cols="20"><%=detail.replace("<p>", "").replace("</p>", "")%></textarea></html></td>
							
								<td><img src="./ProductsImg/<%=img1%>" height="70px" width="70px">
									<img src="./ProductsImg/<%=img2%>" height="70px" width="70px"></td>
								<td><img src="./ProductsImg/<%=img3%>" height="70px" width="70px">
									<img src="./ProductsImg/<%=img4%>" height="70px" width="70px"></td>
								<td>
								<form action="Deletepro" method="post">
								<input type="hidden" name="name" value="<%=name%>">
								<button class="link">DELETE</button>
								</form>
								</td>
								
							</tr>
				
				
							<% 
				
				}while(rs.next());
				}
				else
				{
				out.println("no records found");
				}
			}	
			
			
			else
			{
						String query="select * from products where sale is null and subcategory is null";
								
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery(query);
						if(rs.next())
						{
						%>
								<table>
									<tr>
					
										<th>NAME</th>
										<th>PRICE</th>
										<th>OLDPRICE</th>
										<th>CATEGORY</th>
										<th>COMPANY</th>
										<th>STATUS</th>
										<th>DESCRIPTION</th>
										<th>IMAGE 1,2</th>
										<th>IMAGE 3,4</th>
										
										<th>DELETE</th>
					
										<%
						do
						{
							 name=rs.getString("name");
							String price=rs.getString("price");
							String oldprice=rs.getString("oldprice");
							String sno=rs.getString("Sno");
							String cat=rs.getString("category");
							String cmp=rs.getString("company");
							String img1=rs.getString("image");
							String img2=rs.getString("image2");
							String img3=rs.getString("image3");
							String img4=rs.getString("image4");
							String status=rs.getString("status");
							String detail=rs.getString("Detail");
							%>
									<tr>
										<td><%=name %></td>
										<td><%=price %></td>
										<td><%=oldprice %></td>
										<td><%=cat %></td>
										<td><%=cmp %></td>
										<td><%=status %></td>
										<td><html><textarea rows="4" cols="20"><%=detail.replace("<p>", "").replace("</p>", "")%></textarea></html></td>
									
										<td><img src="./ProductsImg/<%=img1%>" height="70px" width="70px">
											<img src="./ProductsImg/<%=img2%>" height="70px" width="70px"></td>
										<td><img src="./ProductsImg/<%=img3%>" height="70px" width="70px">
											<img src="./ProductsImg/<%=img4%>" height="70px" width="70px"></td>
										<td>
										<form action="Deletepro" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<button class="link">DELETE</button>
										</form>
										</td>
										
									</tr>
					
					
									<% 
						
						}while(rs.next());
					}
					else
					{
						out.println("no records found");
					}
			}
					%>
			</table>


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

