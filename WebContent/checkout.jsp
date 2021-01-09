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
							<h3 style="padding-top: 10px;" class="title">Checkout</h3>
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
			<div class="row">


					<style>
					table {
						border-collapse: collapse;
						width: 100%;
					}
					
					th, td {
						text-align: center;
						padding: 8px;
					}
					
					tr {
						background-color: #ffff;
					}
					
					th {
						background-color: ;
						color: black;
						padding-top: 20px;
						padding-bottom: 20px;
					}
					</style>
			

				<!-- Order Details -->
				<div class=" order-details" style="left:25%;  width: 50%;">
					<div class="section-title text-center">
						<h3 class="title">Your Order Details</h3>
					</div>
					<div class="order-summary">
					<table style="width: 100%;">
					<tr>
					
						<div class="order-col">
						<th>
							<div>
								<strong>PRODUCT</strong>
							</div>
						</th>
						
						
						<th>
							<div>
								<strong>TOTAL</strong>
							</div>
						</th>
						</div>
						</tr>
						<div class="order-products">
							<%	
							String id=(String)session.getAttribute("id");
						int i=0;
						int discount=0;
						int totalprice=0;
						int totaloldprice=0;
						String qr="Select *from cart where id='"+id+"'";
						PreparedStatement ps=con.prepareStatement(qr);
						ResultSet rs=ps.executeQuery();
						if(rs.next())
						{	
						
							
								do 
								{
								String name=rs.getString("name");
								String price=rs.getString("price");
								String oldprice=rs.getString("oldprice");
								String cat=rs.getString("category");
								String cmp=rs.getString("company");
							
								int p=Integer.parseInt(price);
								totalprice=totalprice+p;
								int op=Integer.parseInt(oldprice);
								totaloldprice=totaloldprice+op;
								 discount=op-p;
						%>
								<tr>
							<div class="order-col">
								<td><div><%=name %></div></td>
								
								<td><div><span>&#8377; </span><%=price %></div></td>
							</div>
							</tr>
							<%		i++;
								}
								
								while(rs.next());
							}
							else
							{
							out.println("<h5> Empty</h5>");
							}
						%>
						</div>
						</table>
						<div class="order-col">
							<div>
								<strong>TOTAL:</strong>
							</div>
							<div>
								<strong class="order-total"><span>&#8377; </span><%=totalprice %></strong>
							</div>
						</div>
						
						<div>
						
								<strong style="float: right ;">SHIPING FREE</strong>
							<strong
								style="float: left;" class=""><%=i+" Item" %><%if(i>1){%>s<%} %></strong>
						</div>
					</div>
					<br>
					
					
					<%      String quantity=Integer.toString(i);
							
							String total=Integer.toString(totalprice);
					%>
					<form action="Placeorder.jsp" method="post">
					<input type="hidden" name="quantity" value="<%=quantity%>">
					<input type="hidden" name="total" value="<%=total%>">
					
										<div class="payment-method">
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-1" required="required" value=" Net Banking"> <label
								for="payment-1"> <span></span> Net Banking
							</label>
							<div class="caption">
								<p>For faster payment and instant refund, please use Paypal.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-3" required="required" value="Paypal System"> <label
								for="payment-3"> <span></span> Paypal System
							</label>
							<div class="caption">
								<p>PayPal is one of the largest online payment processors in
									the world.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-2" required="required" value="Pay On Delivery"> <label
								for="payment-2"> <span></span> Pay On Delivery
							</label>
							<div class="caption">

								<p>We also accept Credit/ Debit cards on delivery, subject
									to availability of the payment device. Please check with the
									delivery agent.</p>
							</div>
						</div><br>
					<div class="input-checkbox">
						<input type="checkbox" id="terms" required="required"> <label for="terms">
							<span></span> I've read and accept the <a href="TermAndConditions.html"
							style="color: blue;">terms & conditions</a>
						</label>
					</div>
					<center>
					<input type="submit" style="width:20"
						class="primary-btn order-submit" value=" Place order"/>
						</center>
					</div>
					
						</form>
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