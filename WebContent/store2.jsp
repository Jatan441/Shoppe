<%if(session.getAttribute("restriction") !=null){ %>
<%@include file="db.jsp" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Ironheart</title>

 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

 		<!-- nouislider -->
 		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="css/font-awesome.min.css">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="css/style.css"/>


    </head>
	<body>
		<!-- HEADER -->
		<header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-right">
						<li><a href="Uaccount.jsp"><i class="fa fa-user-o"></i> My Account</a></li>
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
						<div class="col-md-3">
							<div class="header-logo">
								<a href="Home.jsp" class="logo">
									<img src="./img/logo.png" alt="">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
						<center>
							<div class="header-search">
								<form action="SearchStore.jsp" method="post">
									<input class="input" style="border-radius:40px 0px 0px 40px" 
									placeholder="Search here" name="name" >
									<button class="search-btn">Search</button>
								</form>
							</div>
						</div>
						</center>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="Wishlist.jsp"> <i class="fa fa-heart-o"></i> <span>Your
										Wishlist</span>
													<%
										int k=0;
										String id=(String)session.getAttribute("id");
										String qrr1="Select * from wishlist where id='"+id+"'";
										Statement pss1=con.createStatement();
										ResultSet rss1=pss1.executeQuery(qrr1);
						if(rss1.next())
						{
							do
							{
								k++;	
							}
							
							while(rss1.next());
							 %>
							<div class="qty"><%=k %></div>
						
							<%
						}
							%>
								</a>
							</div>
							<!-- /Wishlist -->


									<!-- Cart -->

							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Your
										Cart</span>
										<%
										int j=0;
										String qrr="Select * from cart where id='"+id+"'";
										Statement pss=con.createStatement();
										ResultSet rss=pss.executeQuery(qrr);
						if(rss.next())
						{
							do
							{
								j++;	
							}
							
							while(rss.next());
						 %>
							<div class="qty"><%=j %></div>
							
							<%
						}
							%>

								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<%
										int i=0;
										int totalprice=0;
										
						String qr1="select * from cart where ID='"+id+"'";
						PreparedStatement ps1=con.prepareStatement(qr1);
						ResultSet rs1=ps1.executeQuery();
						if(rs1.next())
						{	
						
							
								do 
								{
									
								String name=rs1.getString("name");
								String price=rs1.getString("price");
								String oldprice=rs1.getString("oldprice");
								String cat=rs1.getString("category");
								String cmp=rs1.getString("company");
								String img1=rs1.getString("image");
								String img2=rs1.getString("image2");
								String img3=rs1.getString("image3");
								String img4=rs1.getString("image4");
								String status=rs1.getString("status");
								String detail=rs1.getString("Detail");
								int sn=rs1.getInt("sno");
								String sno=Integer.toString(sn);
								int p=Integer.parseInt(price);
								totalprice=totalprice+p;
								i++;
						%>

										<div class="product-widget">
										<form action="Product.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<button class="delete" style="border: none; background: none;">
												<div class="product-img">
													<img src="./ProductsImg/<%=img1%>">
												</div>
										</button>
										</form>
											<div class="product-body">
										<form action="Product.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<button  style="border: none; background: none; text-align: left;">
												<h3 class="product-name">
												<%=name %>
												</h3>
										</button>
										</form>
												<h4 class="product-price"><%=price%>.00</h4>
										</div>
											<form action="Deletecartfromstore2.jsp" method="post">
										<input type="hidden" name="sno" value="<%=sno%>">
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
											</form>
										</div>
										<%
								}
								
								while(rs1.next());
							}
						else 
						{
							out.println("<h5>Empty</h5>");
						}
							
						%>

									</div>
									<div class="cart-summary">
										<small><%=i %> Item<%if(i>1){%>s<%} %> selected</small>
										<h5>
											SUBTOTAL: <span>&#8377; </span><%=totalprice %>.00</h5>
									</div>
									<div class="cart-btns">
										<a href="Showcart.jsp">View Cart</a> <a href="checkout.jsp">Checkout
											<i class="fa fa-arrow-circle-right"></i>
										</a>
									</div>
								</div>
							</div>
							<!-- /Cart -->	
								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
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
					<ul class="main-nav nav navbar-nav">
						<li><a href="Home.jsp">Home</a></li>
						<li><a href="Tv.jsp">TV's</a></li>
						<li><a href="Laptops.jsp">Laptops</a></li>
						<li><a href="Smartphones.jsp">Smartphones</a></li>
						<li><a href="Cameras.jsp">Cameras</a></li>
						<li><a href="Accessories.jsp">Accessories</a></li>
						<li class="active"><a href="store1.jsp">Others</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->
			
			

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- ASIDE -->
					<div id="aside" class="col-md-3">
					<form action="SearchStore.jsp" method="post">
						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Categories</h3>
							<div class="checkbox-filter">

								<div class="input-checkbox">
									<input type="checkbox" id="category-1" value="Home Entertainment" name="subcat1">
									<label for="category-1">
										<span></span>
										Home Entertainment
									</label>
								</div>

								<div class="input-checkbox">
									<input type="checkbox" id="category-2" value="Pendrives" name="subcat2">
									<label for="category-2">
										<span></span>
										Pendrives
									</label>
								</div>

								<div class="input-checkbox">
									<input type="checkbox" id="category-3" value="Smart Watches" name="subcat3">
									<label for="category-3">
										<span></span>
										Smart Watches
									</label>
								</div>

								<div class="input-checkbox">
									<input type="checkbox" id="category-4" value="Speakers" name="subcat4">
									<label for="category-4">
										<span></span>
										Speakers
									</label>
								</div>

								<div class="input-checkbox">
									<input type="checkbox" id="category-5" value="Smart Devices" name="subcat5">
									<label for="category-5">
										<span></span>
										Smart Devices
									</label>
								</div>

								<div class="input-checkbox">
									<input type="checkbox" id="category-6" value="Headphones" name="subcat6">
									<label for="category-6">
										<span></span>
										Headphones
									</label>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Price</h3>
							<div class="price-filter">
								<div id="price-slider"></div>
								<div class="input-number price-min">
									<input id="price-min" type="number" name="minprice">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
								<span>-</span>
								<div class="input-number price-max">
									<input id="price-max" type="number" name="maxprice">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Brand</h3>
							<div class="checkbox-filter">
								<div class="input-checkbox">
									<input type="checkbox" id="brand-1" value="Mivi" name="cmp1">
									<label for="brand-1">
										<span></span>
										Mivi
									</label>
								</div>
								<div class="input-checkbox">
									<input type="checkbox" id="brand-2" value="MI" name="cmp2">
									<label for="brand-2">
										<span></span>
										MI
									</label>
								</div>
								<div class="input-checkbox">
									<input type="checkbox" id="brand-3" value="Motorola" name="cmp3">
									<label for="brand-3">
										<span></span>
										Motorola
									</label>
								</div>
								<div class="input-checkbox">
									<input type="checkbox" id="brand-4" value="Samsung" name="cmp4">
									<label for="brand-4">
										<span></span>
										Samsung
									</label>
								</div>
								<div class="input-checkbox">
									<input type="checkbox" id="brand-5" value="Micromax" name="cmp5">
									<label for="brand-5">
										<span></span>
										Micromax
									</label>
								</div>
								<div class="input-checkbox">
									<input type="checkbox" id="brand-6" value="Realme" name="cmp6">
									<label for="brand-6">
										<span></span>
										Realme
									</label>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->
						<br><button  class="primary-btn" style="position: relative;"> 
						FIND</button><br>
						</form>
					</div>
					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
					<!-- store products -->
						<div class="row">
							
							<!-- product -->
							<% 
							String qr="Select * from products where subcategory is not null limit 13,24";
							Statement st = con.createStatement();
							ResultSet rs=st.executeQuery(qr);
							if(rs.next())
							
								do{
									String name=rs.getString("Name");
									String price=rs.getString("price");
									String cat=rs.getString("category");
									String subcat=rs.getString("Subcategory");
									String cmp=rs.getString("company");
									String oldprice=rs.getString("oldprice");
									String img1=rs.getString("Image");
							
							%>
							<div class="col-md-4 col-xs-6" style="width: 215px; height: 430px">
								<div class="product">
								<form action="Product.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<button style="border: none; background: none;">
									<div class="product-img">
										<img src="./ProductsImg/<%=img1 %>" alt="">
									</div>
									</button>
									</form>
									<div class="product-body">
										<p class="product-category"><%=subcat %></p>
										<h3 class="product-name">
										<form action="Product.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<button style="border: none; background: none;">
										<%=name %></h3>
										</button>
										</form>
										<form action="AddproIntoWishlistFromStore2.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<div class="product-btns"  style="float: left; padding-left : 30px;">
											<button class="add-to-wishlist">
												<i class="fa fa-heart-o"></i>
												<span class="tooltipp">Wish List</span>
											</button>
											</div>
											</form>
											
										<form action="Product.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<div class="product-btns">
										<button class="quick-view">
										<i class="fa fa-eye"></i>
										<span class="tooltipp">quick view</span></a>
												</button>
												</div>
												</form>
							
										<h4 class="product-price"><span>&#8377; </span><%=price %>.00 
										<br>
										<del class="product-old-price"><span>&#8377; </span><%=oldprice %>.00</del></h4>
										
					
									</div>
									<div class="add-to-cart">
									<form action="Addcartfromstore2.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
										</form>
									</div>
								</div>
							</div>
							<!-- /product -->
							<%
								}
								while(rs.next());
							else
							{
								out.println("<h3>Empty</h3>");
							}
							%>

						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
						
							<ul class="store-pagination">
							<li><a href="store1.jsp"><i class="fa fa-angle-left"></i></a></li>
								<li><a href="store1.jsp">1</a></li>
								<li class="active">2</li>
								<li><a href="store3.jsp">3</a></li>
								<li><a href="store4.jsp">4</a></li>
								<li><a href="store5.jsp">5</a></li>
								<li><a href="store3.jsp"><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Sign Up for the <strong>NEWSLETTER</strong></p>
							<form action="https://mail.google.com/mail/u/0/#sent?compose=new" method="post">
								<input class="input" type="email" placeholder="Enter Your Email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
							</form>
							<ul class="newsletter-follow">
							<li><a
								href="https://www.facebook.com/Ironheart-104596431155376/?modal=admin_todo_tour"><i
									class="fa fa-facebook"></i></a></li>
							<li><a href="https://twitter.com/jatanchoudhary1"><i
									class="fa fa-twitter"></i></a></li>
							<li><a href="https://www.instagram.com/jatan.choudhary._/"><i
									class="fa fa-instagram"></i></a></li>
							<li><a href="https://in.pinterest.com/"><i
									class="fa fa-pinterest"></i></a></li>
						</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
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