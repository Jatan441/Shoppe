<%if(session.getAttribute("restriction") !=null){ %>
<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>

<!DOCTYPE html>
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
		
				<ul class="header-links pull-right">
					
					<li><a href="Uaccount.jsp"><i class="fa fa-user-o"></i> My
							Account</a></li>
				</ul>
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
						<div class="">
							<a href="Home.jsp" class="logo "> <img src="./img/logo.png"
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
							<h3 style="padding-top: 10px;" class="title">Your Cart</h3>
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
		
			<!-- row -->
			<div class="row" >
				
			

			<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
						<%	
						int i=0;
						int discount=0;
						int totalprice=0;
						int totaloldprice=0;
						String id=(String)session.getAttribute("id");
						String qr="Select * from cart  where id='"+id+"'";
						Statement ps=con.createStatement();
						ResultSet rs=ps.executeQuery(qr);
						if(rs.next())
						{	
						
							
								do 
								{
								String name=rs.getString("name");
								String price=rs.getString("price");
								String oldprice=rs.getString("oldprice");
								String cat=rs.getString("category");
								String subcat=rs.getString("subcategory");
								String sale =rs.getString("sale");
								String cmp=rs.getString("company");
								String img1=rs.getString("Image");
								String img2=rs.getString("Image2");
								String img3=rs.getString("Image3");
								String img4=rs.getString("Image4");
								String status=rs.getString("Status");
								String detail=rs.getString("Detail");
								int sn=rs.getInt("sno");
								String sno=Integer.toString(sn);
															
								int p=Integer.parseInt(price);
								totalprice=totalprice+p;
								int op=Integer.parseInt(oldprice);
								totaloldprice=totaloldprice+op;
								 discount=op-p;
								 
								 
						%>
				<!-- product -->
				
				<div  style="height: 350px;width: 192px;
				 float: left; margin-right: 25px; margin-bottom: 20px;">

					<div class="product" >
						<form action="Product.jsp" method="post">
						<input type="hidden" name="name" value="<%=name%>">
						<input type="hidden" name="price" value="<%=price%>">
						<input type="hidden" name="oldprice" value="<%=oldprice%>">
						<input type="hidden" name="sale" value="<%=sale%>">
						<input type="hidden" name="cat" value="<%=cat%>">
						<input type="hidden" name="cmp" value="<%=cmp%>">
						<input type="hidden" name="subcat" value="<%=subcat%>">
						<input type="hidden" name="img1" value="<%=img1%>">
						<button style="background: none; border: none;">
						<div class="product-img">
							<img src="./ProductsImg/<%=img1 %>" alt="">	
							<%if((subcat.equals("null") || subcat.equals(null)) && (cat.equals("null") || cat.equals(null))){%>
							<div class="product-label">
							<span class="new"><%int percent= (Integer.parseInt(price)*100)/Integer.parseInt(oldprice);%>
							-<%=100-percent%>%
							</span>
							</div>
							<%} %>
						</div>
						</button>
						</form>
						<div class="product-body">
							<p class="product-category">
							<% if((subcat.equals("null") || subcat.equals(null)) && (sale.equals("null") || sale.equals(null)))
							{
								out.println(cat);
							}
							%>
							<% if((subcat.equals("null") || subcat.equals(null)) && (cat.equals("null") || cat.equals(null)))
							{
								out.println(sale);
							}
							%>
							<% if((cat.equals("null") || cat.equals(null)) && (sale.equals("null") || sale.equals(null)))
							{
								out.println(subcat);
							}
							%>
							</p>
							<h3 class="product-name"><%=name %></h3>
							<h4 class="product-price"><span>&#8377; </span><%=price %>.00<br>
							<del class="product-old-price"><span>&#8377; </span><%=oldprice%>.00</del>
							</h4>
						 
							
						</div>
						<div class="add-to-cart">
						<form action="Deletecart.jsp">
						<input type="hidden" name="sno" value="<%=sno %>">
							<button class="add-to-cart-btn">
								<i class="fa fa-shopping-cart.jsp"></i> 
								Remove
							</button>
							</form>
						</div>
					</div>


				</div>
				<!-- /product -->
				<%		i++;
								}
								
								while(rs.next());
							}
							else
							{
							out.println("<h5> Insert product into the cart.</h5>");
							}
						%>

					
						</div>
						<!-- /Billing Details -->

					</div>

					<!-- Order Details -->


				<div class="col-md-5 order-details">
					<div class="section-title text-center">
						<h3 class="title">Total</h3>
					</div>
					<div class="order-col">
						<div>
							<strong style="float: left;">ITEMS</strong><strong
								style="float: right;" class="order-total"><%=i+" Item" %><%if(i>1){%>s<%} %></strong>
						</div>
						<br>
						<br>
						<%
						String qr1="Select * from cart  where id='"+id+"'";
						Statement ps1=con.createStatement();
						ResultSet rs1=ps.executeQuery(qr1);
						if(rs1.next())
					
							
								do 
								{
								 String name=rs1.getString("name");
								String price=rs1.getString("price"); %>
								<table style="width: 100%">
							<tr>
						<div>
							<td style="width: 110px"><strong style="float: left;"><%=name %></strong></td>
							
							<td style="float: right;"><strong style="float: right;" class="order-total">
							<span>&#8377; </span><%=price %>.00</strong>
							</td>
						</div>
						</tr>
						</table>
						<br>
						<%
								}
								while(rs1.next());
						
						%>
						<div>
							<strong style="float: left;">OLD PRICE</strong><strong
								style="float: right;" class="order-total"><span>&#8377; </span><%=totaloldprice %>.00</strong>
						</div>
						<br>
						<div>
							<strong style="float: left;">NEW PRICE</strong><strong
								style="float: right;" class="order-total"><span>&#8377; </span><%=totalprice %>.00</strong>
						</div>
						<br>
						<div>
							<strong style="float: left;">YOU SAVED</strong><strong
								style="float: right;" class="order-total"><span>&#8377; </span><%=discount %>.00</strong>
						</div>
						<br>
					</div>
					<a href="checkout.jsp" class="primary-btn order-submit">Checkout</a>
				</div>
				<!-- /Order Details -->



			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

	</div>
	<!-- /Section -->
	

	

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<div class="container">
			<div class="row">
			
			

			
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
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">About Us</h3>
							<p>From selling globally to locally, from making money on
								your site to expanding your business.</p>
							<ul class="footer-links">
								<li><a href="https://www.google.com/maps"><i
										class="fa fa-map-marker"></i>Location</a></li>
								<li><a href="https://globfone.com/call-phone/"><i
										class="fa fa-phone"></i>+91-9630-167-090</a></li>
								<li><a href="https://mail.google.com/mail/u/0/#inbox"><i
										class="fa fa-envelope-o"></i>ironheart@gmail.com</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Categories</h3>
							<ul class="footer-links">
								<li><a href="Tv.jsp">TVs</a></li>
								<li><a href="Laptops.jsp">Laptops</a></li>
								<li><a href="Smartphones.jsp">Smartphones</a></li>
								<li><a href="Cameras.jsp">Cameras</a></li>
								<li><a href="Accessories.jsp">Accessories</a></li>
							</ul>
						</div>
					</div>

					<div class="clearfix visible-xs"></div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Information</h3>
							<ul class="footer-links">
								<li><a href="Aboutus.html">About Us</a></li>
								<li><a href="Security.html">Security</a></li>
								<li><a href="Privacypolicy.html">Privacy Policy</a></li>
								<li><a href="Returnspolicy.html">Returns Policy</a></li>
								<li><a href="TermAndConditions.html">Terms & Conditions</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Service</h3>
							<ul class="footer-links">
								<li><a href="Uaccount.jsp">My Account</a></li>
								<li><a href="Showcart.jsp">View Cart</a></li>
								<li><a href="Wishlist.jsp">Wishlist</a></li>
								<li><a href="https://www.bluedart.com/tracking">Track
										My Order</a></li>
								<li><a href="Reportinfringment.html">Report Infringment</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->

		<!-- bottom footer -->
		<div id="bottom-footer" class="section">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="footer-payments">
							<li><a href="https://onboarding.payumoney.com/app/account"><i
									class="fa fa-cc-visa"></i></a></li>
							<li><a href="https://www.paypal.com/in/signin"><i
									class="fa fa-cc-paypal"></i></a></li>
							<li><a href="https://www.mastercard.us/en-us.html"><i
									class="fa fa-cc-mastercard"></i></a></li>
							<li><a href="https://www.discover.com/"><i
									class="fa fa-cc-discover"></i></a></li>

						</ul>

					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bottom footer -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
<%}else response.sendRedirect("Restriction");%>