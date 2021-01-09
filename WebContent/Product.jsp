<%if(session.getAttribute("restriction") !=null){ %>
<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>

<!DOCTYPE html>



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
								<form action="search.jsp" method="post">
								<input class="input" style="border-radius:40px 0px 0px 40px" 
									placeholder="Search here" name="name" >
									<button class="search-btn" type="submit">Search</button>
								</form>
							</div>
							</center>
						</div>
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
								<a href="Showcart.jsp"> <i class="fa fa-shopping-cart"></i> <span>Your
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
							
							<%}%>
								</a>
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
					<li><a href="store1.jsp">Others</a></li>
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



				<%
				String cat=request.getParameter("cat");
				String cmp=request.getParameter("cmp");
				String sale=request.getParameter("sale");
				String subcat=request.getParameter("subcat");
		String name=request.getParameter("name");
		String qr="Select * from products where name='"+name+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		if(rs.next())
		{
		String price=rs.getString("price");
		String oldprice=rs.getString("oldprice");
		 cat=rs.getString("category");
		 sale=rs.getString("sale");
		 subcat=rs.getString("subcategory");
		 cmp=rs.getString("company");
		String img1=rs.getString("Image");
		String img2=rs.getString("Image2");
		String img3=rs.getString("Image3");
		String img4=rs.getString("Image4");
		String status=rs.getString("status");
		String detail=rs.getString("detail");
		
			
		%>



				<!-- Product main img -->
				<div class="col-md-5 col-md-push-2">
					<div id="product-main-img">
						<div class="product-preview">
							<img src="./ProductsImg/<%=img1%>" alt="">
						</div>

						<div class="product-preview">
							<img src="./ProductsImg/<%=img2%>" alt="">
						</div>

						<div class="product-preview">
							<img src="./ProductsImg/<%=img3%>" alt="">
						</div>

						<div class="product-preview">
							<img src="./ProductsImg/<%=img4%>" alt="">
						</div>
					</div>
				</div>
				<!-- /Product main img -->

				<!-- Product thumb imgs -->
				<div class="col-md-2  col-md-pull-5">
					<div id="product-imgs">
						<div class="product-preview">
							<img src="./ProductsImg/<%=img1%>" alt="">
						</div>

						<div class="product-preview">
							<img src="./ProductsImg/<%=img2%>" alt="">
						</div>

						<div class="product-preview">
							<img src="./ProductsImg/<%=img3%>" alt="">
						</div>

						<div class="product-preview">
							<img src="./ProductsImg/<%=img4%>" alt="">
						</div>
					</div>
				</div>
				<!-- /Product thumb imgs -->

				<!-- Product details -->
				<div class="col-md-5">
					<div class="product-details ">
					<%if(sale!=null){ %>
					<div style="width: 500px; height: 100px; position:relative;">
					<h2 style="background-color:#D10024; float:left;
					height:100px; width:100px; text-align:center; padding-top:30px; 
					 border-radius: 50px 50px;position:relative;
					 color:white;"><%int percent=(Integer.parseInt(price)*100)/Integer.parseInt(oldprice);%>
					 -<%=100-percent %>%
					 </h2>
						<div style="padding-right: 20px; padding-top: 20px;">
						 <h3 style="background-color:#D10024; padding-top:10px; 
					height:50px; width:370px; text-align:center; float:right; 
					 border-radius: 40px 40px;  position:relative;
					 color:white;">
					
									
										<p id="demo2"></p>
										<script>
										var countDownDate = new Date(sessionStorage.getItem("date")).getTime();
										var x = setInterval(function() {
										var now = new Date().getTime();
										  var distance = countDownDate - now;
										  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
										  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
										  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
										  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
										  document.getElementById("demo2").innerHTML = days +" day "+hours+" hrs. "+minutes+" min. "+seconds+" sec. " ;
										  if (distance < 0) {
											    clearInterval(x);
											    document.getElementById("demo2").innerHTML = "0";
											  }
										}, 1000);
										</script>
										
										</h3>
										 </div>
					</div>
					<%}%>
					<br>
						<h2 class="product-name"><%=name %></h2>
						<div>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o"></i>
							</div>

						</div>
						<div>
							<h3 class="product-price">
									<span>&#8377; </span><%=price %>.00
								<del class="product-old-price">
										<span>&#8377; </span><%=oldprice %>.00</del>
							</h3>
							<span class="product-available"><%=status%></span>
						</div>

									
						<div><%out.println( detail.substring(0,Math.min(detail.length(), detail.indexOf("</p>"))));%></div>
					
						<ul class="product-links">
							<li>Category :</li>	
							<li>
							<%if(subcat==null && sale==null){out.println(cat);}
							else if(sale==null && cat==null){out.println(subcat);}
							else{out.println(sale);}
							%></li>

						</ul>

						<ul class="product-links">
							<li>Brand :</li>
							<li><%=cmp %></li>

						</ul>
						<br>
						
						
						<form action="AddproIntoWishlistFromProduct.jsp" method="post">
						<input type="hidden" name="name" value="<%=name%>">
						<input type="hidden" name="price" value="<%=price%>">
						<input type="hidden" name="oldprice" value="<%=oldprice%>">
						<input type="hidden" name="cat" value="<%=cat%>">
						<input type="hidden" name="subcat" value="<%=subcat%>">
						<input type="hidden" name="sale" value="<%=sale%>">
						<input type="hidden" name="img1" value="<%=img1%>">
						<input type="hidden" name="cmp" value="<%=cmp%>"> 
						<button style="background:none ; border: none;">
						<ul class="product-btns">
							<li><i	class="fa fa-heart-o"></i> add to wishlist
									</li>
						</ul>
						</button>
						</form>
						<br>

						<%if(sale!=null){%>
						<h3>
									<p id="demo"></p>
										<script>
										var countDownDate = new Date(sessionStorage.getItem("date")).getTime();
										var x = setInterval(function() {
										var now = new Date().getTime();
										  var distance = countDownDate - now;
										  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
										  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
										  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
										  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
										  document.getElementById("demo").innerHTML = days +" day "+hours+" hrs. "+minutes+" min. "+seconds+" sec. " ;
										  if (distance < 0) {
											    clearInterval(x);
											    document.getElementById("demo").innerHTML = "<%out.println("Sale Is Over");%>";
										}, 1000);
										</script>
										</h3>
										<%} %>
						<div class="add-to-cart">
						<%if(status.equals("In Stock")){ %>
						<form action="Addcartfrompro.jsp" method="post">
						<input type="hidden" name="name" value="<%=name%>">
						<input type="hidden" name="price" value="<%=price%>">
						<input type="hidden" name="oldprice" value="<%=oldprice%>">
						<input type="hidden" name="sale" value="<%=sale%>">
						<input type="hidden" name="cat" value="<%=cat%>">
						<input type="hidden" name="subcat" value="<%=subcat%>">
						<input type="hidden" name="img1" value="<%=img1%>">
						<input type="hidden" name="cmp" value="<%=cmp%>"> 
							<button class="add-to-cart-btn">
								<i class="fa fa-shopping-cart"></i> add to cart
							</button>
							</form>
							<%}
						else
						{	
						%>
						<button class="add-to-cart-btn">
								 Currently Not Available
							</button>
							<%} %>
						</div>


						<ul class="product-links">
							<li>Share:</li>
							<li><a
								href="https://www.facebook.com/Ironheart-104596431155376/?modal=admin_todo_tour"><i
									class="fa fa-facebook"></i></a></li>
							<li><a href="https://twitter.com/jatanchoudhary1"><i
									class="fa fa-twitter"></i></a></li>
							<li><a href="https://www.instagram.com/jatan.choudhary._/"><i
									class="fa fa-instagram"></i></a></li>
							<li><a
								href="https://mail.google.com/mail/u/0/#sent?compose=new"><i
									class="fa fa-envelope"></i></a></li>
						</ul>

					</div>
				</div>
				<!-- /Product details -->

				<!-- Product tab -->
				<div class="col-md-12">
					<div id="product-tab">
						<!-- product tab nav -->
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>

						</ul>
						<!-- /product tab nav -->

						<!-- product tab content -->
						<div class="tab-content">
							<!-- tab1  -->
							<div id="tab1" class="tab-pane fade in active">
								<div class="row">
									<div class="col-md-12">
									
									<%=detail%>
								<%} %>	
									</div>
								</div>
							</div>
							<!-- /tab1  -->

						</div>
						<!-- /product tab content  -->
					</div>
				</div>
				<!-- /product tab -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->


<!-- Section -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 class="title">Related Products</h3>
						</div>
					</div>

					<%
						
						 qr="Select *from products where (category='"+cat+"' or subcategory='"+subcat+"' or sale='"+sale+"') and company='"+cmp+"' and name !='"+name+"' order by rand() Limit 0,4";
						Statement ps=con.createStatement();
						 rs=ps.executeQuery(qr);
						if(rs.next())
						{	
						
							
								do 
								{
								 name=rs.getString("name");
								String price=rs.getString("price");
								String oldprice=rs.getString("oldprice");
								 cat=rs.getString("category");
								 subcat=rs.getString("Subcategory");
								 sale=rs.getString("sale");
								 cmp=rs.getString("company");
								String img1=rs.getString("image");
								String img2=rs.getString("image2");
								String img3=rs.getString("image3");
								String img4=rs.getString("image4");
								String status=rs.getString("status");
								String detail=rs.getString("Detail");
						%>

			
				<!-- product -->
				<div class="col-md-3 col-xs-6">
					<div class="product">
										<form action="Product.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="sale" value="<%=sale%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
										<button style="border: none; background: none;">
							<div class="product-img">
								<img src="./ProductsImg/<%=img1%>">
								<%if(sale!=null){ %>
								<div class="product-label">
								<span class="new"><%int percent= (Integer.parseInt(price)*100)/Integer.parseInt(oldprice);%>
								-<%=100-percent%>% 
							<span>
							</div>
							<%} %>
							</div>
						</button>
						</form>
						<div class="product-body">
							<p class="product-category"><%if(subcat==null && sale==null){out.println(cat);}
							else if(sale==null && cat==null){out.println(subcat);}
							else{out.println(sale);}
							%></p>
							<h3 class="product-name"><%=name %></h3>
							<h4 class="product-price">
								<span>&#8377; </span><%=price %>.00<del class="product-old-price">
									<span>&#8377; </span><%=oldprice%>.00</del>
							</h4>
							<div class="product-rating"></div>
							
							<form action="AddproIntoWishlistFromProduct.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="sale" value="<%=sale%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
										<input type="hidden" name="cmp" value="<%=cmp%>">
									
							<div class="product-btns"  style="float: left; padding-left : 50px;">
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
										<input type="hidden" name="sale" value="<%=sale%>">
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
						</div>
						<div class="add-to-cart">
										<form action="Addcartfrompro.jsp" method="post">
										<input type="hidden" name="name" value="<%=name%>">
										<input type="hidden" name="price" value="<%=price%>">
										<input type="hidden" name="oldprice" value="<%=oldprice%>">
										<input type="hidden" name="cat" value="<%=cat%>">
										<input type="hidden" name="sale" value="<%=sale%>">
										<input type="hidden" name="subcat" value="<%=subcat%>">
										<input type="hidden" name="img1" value="<%=img1%>">
							<button class="add-to-cart-btn">
								<i class="fa fa-shopping-cart"></i>Add
									to cart
							</button>
							</form>
						</div>
					</div>


				</div>
				<!-- /product -->
				<%
								}
								
								while(rs.next());
							}
						else
						{
							out.println("<h5>Empty</h5>");
						}
							
						%>

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /Section -->
	

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
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
<%}else response.sendRedirect("Restriction");%>