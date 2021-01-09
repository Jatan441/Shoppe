

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Deletecart
 */
@WebServlet("/Deletecart")
public class Deletecart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletecart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("name");
		try 
		{	
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="delete from cart where Name=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, name);
			int i=ps.executeUpdate();
			
			if(i>0)
			{ 
				RequestDispatcher rd=request.getRequestDispatcher("Showpro.jsp");
				rd.include(request, response);
				
			}
			else	
			{	
				RequestDispatcher rd=request.getRequestDispatcher("Showpro.jsp");
				rd.include(request, response);
				out.println("Record Not Deleted");
			}
		} 
		catch (Exception e) 
			{
			out.print(e);
			}
		
	}
	



	}


