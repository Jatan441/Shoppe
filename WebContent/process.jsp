<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Fname=request.getParameter("first-name");
String Lname=request.getParameter("last-name");
String cat=request.getParameter("cat");
String email=request.getParameter("email");
String add=request.getParameter("address");
String city=request.getParameter("city");
String pin=request.getParameter("pin-code");
String country=request.getParameter("country");
String mob=request.getParameter("mob");
String img=request.getParameter("img");
String pwd=request.getParameter("password");


session.setAttribute("Fname",Fname);
session.setAttribute("Lname",Lname);
session.setAttribute("cat",cat);
session.setAttribute("email",email);
session.setAttribute("add",add);
session.setAttribute("city",city);
session.setAttribute("pin",pin);
session.setAttribute("country",country);
session.setAttribute("mob",mob);
session.setAttribute("img",img);
session.setAttribute("pwd",pwd);
String key = "r8NvgiHIkDX7ysnYpVwJqhORMBS4QKdefoAULm5WTPc6j0tbE3xXj2gByOf1TDPYpzqFK5a9l637estw";
Random rand = new Random();
int otp = rand.nextInt(99999);
String otpvalue = Integer.toString(otp);
session.setAttribute("otpvalue",otpvalue);
try {
	
	String requestUrl  = "https://www.fast2sms.com/dev/bulk?authorization="+key
	+ "&sender_id=FSTSMS"
	+ "&language=english"
	+ "&route=qt"
	+ "&numbers="+mob
	+ "&message=24777"
	+ "&variables={AA}|{FF}"
	+ "&variables_values="+otpvalue+"|"+email;
	URL url = new URL(requestUrl);
	HttpURLConnection uc = (HttpURLConnection)url.openConnection();
	System.out.println(uc.getResponseMessage());
	uc.disconnect();
	} catch(Exception ex) {
	System.out.println(ex.getMessage());
	}
		response.sendRedirect("otp.jsp");
%>
</body>
</html>