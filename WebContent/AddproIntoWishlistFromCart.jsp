<%@page errorPage="errorforwishlist.jsp"%>
<%@include file="db.jsp"%>
<% 
		String id=(String)session.getAttribute("id");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String oldprice=request.getParameter("oldprice");
		String category=request.getParameter("cat");
		String img1=request.getParameter("img1");
		String subcat=request.getParameter("subcat");
		String sale = request.getParameter("sale");
		String qr="insert into wishlist(name,price,oldprice,category,Id,Image,Sale,Subcategory) values('"+name+"','"+price+"','"+oldprice+"','"+category+"','"+id+"','"+img1+"','"+sale+"','"+subcat+"')";
		Statement st=con.createStatement();
		int i=st.executeUpdate(qr);
		if(i>0)
			{
			response.sendRedirect("Showcart.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Showcart.jsp");
				rd.include(request, response);
				out.println("Record Not Added");
				
			}
%>
