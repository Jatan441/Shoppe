<%@page isErrorPage="true"%>
<%@include file="db.jsp"%>
<%

RequestDispatcher rd=request.getRequestDispatcher("Wishlist.jsp");
rd.include(request, response);
out.println("<script> window.alert('This product is already in wishlist')</script>");
%>
