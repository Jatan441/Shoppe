<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
<% 	
		String sno=request.getParameter("sno");
		String qr="delete from cart where sno='"+sno+"'";
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
				out.println("Record Not deleted");
				
			}
%>
