<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
<% 
		String id=(String)session.getAttribute("id");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String subcat=request.getParameter("subcat");
		String oldprice=request.getParameter("oldprice");
		String cat=request.getParameter("cat");
		String img1=request.getParameter("img1");
		String sale=request.getParameter("sale");
		String qr="insert into Cart(name,price,oldprice,category,Id,Image,Subcategory,sale) values('"+name+"','"+price+"','"+oldprice+"','"+cat+"','"+id+"','"+img1+"','"+subcat+"','"+sale+"')";
		Statement st=con.createStatement();
		int i=st.executeUpdate(qr);
		if(i>0)
			{	
			response.sendRedirect("store5.jsp");
			
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("store5.jsp");
				rd.include(request, response);
				out.println("Record Not Added");
				
			}
%>