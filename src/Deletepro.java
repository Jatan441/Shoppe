

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
 * Servlet implementation class Deletepro
 */
@WebServlet("/Deletepro")
public class Deletepro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletepro() {
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
			String qr1="delete from products where Name=?";
			PreparedStatement ps1=con.prepareStatement(qr1);
			ps1.setString(1, name);
			int i=ps1.executeUpdate();
					
			if(i>0)
			{ 
				String qr2="delete from Cart where Name=?";
				PreparedStatement ps2=con.prepareStatement(qr2);
				ps2.setString(1, name);
				ps2.executeUpdate();
				
				String qr3="delete from wishlist where name=?";
				PreparedStatement ps3=con.prepareStatement(qr3);
				ps3.setString(1, name);
				ps3.executeUpdate();
				
				RequestDispatcher rd=request.getRequestDispatcher("Show.html");
				rd.include(request, response);
				
			}
			else	
			{	
				RequestDispatcher rd=request.getRequestDispatcher("Adminhome.html");
				rd.include(request, response);
				out.println("Record Not Deleted");
			}
		} catch (Exception e) 
			{
			out.print(e);
			}
		
	}
	

}
