<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String otp=request.getParameter("otp");
String otpvalue=(String)session.getAttribute("otpvalue");
if(!(StringUtils.isNullOrEmpty("otp") && StringUtils.isNullOrEmpty("otpvalue")))
{
if((otp.equals(otpvalue)))
{
response.sendRedirect("Uregs");
}
else
{
	session.setAttribute("msgg", "<div class='order-details'style=' position:relative; width: 40%; text-align: center; left: 30%;'><h3>&#9888; Wrong OTP</h3></div>");
 	RequestDispatcher rd=request.getRequestDispatcher("otp.jsp");
	rd.include(request, response);
}
}
else
{
	session.setAttribute("msgg", "");

 	RequestDispatcher rd=request.getRequestDispatcher("otp.jsp");
	rd.include(request, response);
}
%>