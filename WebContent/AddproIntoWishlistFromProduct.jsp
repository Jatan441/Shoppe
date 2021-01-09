<%@page errorPage="errorforwishlist.jsp"%>
<%@include file="db.jsp"%>
<% 
		String id=(String)session.getAttribute("id");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String subcat=request.getParameter("subcat");
		String sale = request.getParameter("sale");
		String oldprice=request.getParameter("oldprice");
		String cat=request.getParameter("cat");
		String img1=request.getParameter("img1");
		if(cat==null)
		{
			cat=null;
		}
		if(subcat==null)
		{
			subcat=null;
		}
		if(sale==null)
		{
			sale=null;
		}
		String qr="insert into wishlist(name,price,oldprice,category,Id,Image,Subcategory,Sale) values('"+name+"','"+price+"','"+oldprice+"','"+cat+"','"+id+"','"+img1+"','"+subcat+"','"+sale+"')";
		Statement st=con.createStatement();
		int i=st.executeUpdate(qr);
		if(i>0)
			{
			response.sendRedirect("Wishlist.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Wishlist.jsp");
				rd.include(request, response);
				out.println("Record Not Added");
				
			}
%>
