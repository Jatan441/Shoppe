

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Showcart
 */
@WebServlet("/Showcart")
public class Showcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Showcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="Select *from cart";
			PreparedStatement ps=con.prepareStatement(qr);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{	
				out.println("<table align=center border=1 >");
				out.println("<tr><th>Name</th><th>Price</th><th>Category</th><th>Company</th>");
				
					do 
					{
					String name=rs.getString("name");
					String price=rs.getString("price");
					String cat=rs.getString("category");
					String cmp=rs.getString("company");
					
					out.println("<tr><td>"+name+"</td><td>"+price+"</td><td>"+cat+"</td><td>"+cmp+"</td>");
					out.println("<td><a href=Deletecart?name="+name+">Delete from cart</td>" );
					}
				
				while(rs.next());
			}
			else
			{
			out.println("Record NotFound");
			}
		
			con.close();
			out.println("</table>");
			}
			catch (Exception e) 
			{
			out.println(e);
			}
		
	}
		
	}
