

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addpro2
 */
@WebServlet("/Addpro2")
public class Addpro2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addpro2() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
		PrintWriter out=response.getWriter();
    	response.setContentType("text/html");
    	String name=request.getParameter("name");
    	String price=request.getParameter("price");
    	String oldprice=request.getParameter("oldprice");
    	String sale=request.getParameter("sale");
    	String cmp=request.getParameter("cmp");
    	String img1=request.getParameter("img1");
    	String img2=request.getParameter("img2");
    	String img3=request.getParameter("img3");
    	String img4=request.getParameter("img4");
    	String status=request.getParameter("status");
    	String detail=request.getParameter("detail");
    	try {
			Class.forName("com.mysql.jdbc.Driver");
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
    	String qr="insert into products (name,price,oldprice,company,Image,Image2,Image3,Image4,Status,Detail,sale) values('"+name+"','"+price+"','"+oldprice+"','"+cmp+"','"+img1+"','"+img2+"','"+img3+"','"+img4+"','"+status+"','"+detail+"','"+sale+"')";
    	Statement ps=con.createStatement();
    	int i=ps.executeUpdate(qr);
    	if(i>0)
    	{
    		response.sendRedirect("Show.html");
    	}
    	else
    	{
    		RequestDispatcher rs=request.getRequestDispatcher("Adminhome.html");
    		out.println("Product Not Added ");
    	}

    }
     catch (Exception e) {
		// TODO Auto-generated catch block
		out.println(e);
	}
	}
	}

	
