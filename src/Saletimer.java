

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Saletimer
 */
@WebServlet("/Saletimer")
public class Saletimer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Saletimer() {
        super();
        
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out=response.getWriter();
    	response.setContentType("text/html");
    	String date=request.getParameter("date");
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="Update Sale set Timer='"+date+"' where Name='Jatan'";
			Statement st=con.createStatement();
			int i=st.executeUpdate(qr);
			if(i>0)
			{
				response.sendRedirect("Adminhome.html");
			}
			else
			{
				response.sendRedirect("Adminhome.html");
			}
		} catch (Exception e) {
			out.println(e);
		}
    	
    }
}
