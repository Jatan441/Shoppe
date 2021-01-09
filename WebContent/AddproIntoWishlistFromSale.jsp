<%@page errorPage="errorforwishlist.jsp"%>
<%@include file="db.jsp"%>
<% 
		String id=(String)session.getAttribute("id");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String oldprice=request.getParameter("oldprice");
		String sale=request.getParameter("sale");
		String img1=request.getParameter("img1");
		String subcat=request.getParameter("subcat");
		String cat = request.getParameter("category");
		String qr="insert into wishlist(name,price,oldprice,category,Id,Image,Sale,Subcategory) values('"+name+"','"+price+"','"+oldprice+"','"+cat+"','"+id+"','"+img1+"','"+sale+"','"+subcat+"')";
		Statement st=con.createStatement();
		int i=st.executeUpdate(qr);
		if(i>0)
			{
			response.sendRedirect("Sale.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Sale.jsp");
				rd.include(request, response);
				out.println("Record Not Added");
				
			}
%>
