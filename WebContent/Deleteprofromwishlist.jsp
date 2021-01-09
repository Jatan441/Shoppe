<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
<% 	
		String name=request.getParameter("name");
		String qr="delete from wishlist where name='"+name+"'";
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
				out.println(" Not Deleted");
				
			}
%>
