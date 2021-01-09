<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
<% 	
		String sno=request.getParameter("sno");
		String qr="delete from cart where sno='"+sno+"'";
		Statement st=con.createStatement();
		int i=st.executeUpdate(qr);
		if(i>0)
			{	
			response.sendRedirect("Laptops.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Laptops.jsp");
				rd.include(request, response);
				out.println("Record Not Added");
				
			}
%>
