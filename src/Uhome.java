

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
 * Servlet implementation class Uhome
 */
@WebServlet("/Uhome")
public class Uhome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uhome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String cat=request.getParameter("cat");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr=" select * from products where category=? ";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, cat);
			ResultSet rs=ps.executeQuery();
			out.println("<table align=center border=1 >");
			if(rs.next())
			{	
				out.println("<tr><th>Name</th><th>Price</th><th>Category</th><th>Company</th>");
					do 
					{
					String name=rs.getString("name");
					String price=rs.getString("price");
					String cmp=rs.getString("company");
					out.println("<tr><td>"+name+"</td><td>"+price+"</td><td>"+cat+"</td><td>"+cmp+"</td>");
					out.println("<td><a href=Addcart?name="+name+"&price="+price+"&cat="+cat+"&cmp="+cmp+">Add to cart</a></td></tr>");
					}
				
				while(rs.next());
			}
			else
			{
			out.println("Record Not Found");
			}
			out.println("</table>");
			
			
			
		} 
		catch (Exception e) 
		{
			out.println(e);
		}
		
	}

}
