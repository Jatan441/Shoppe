

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Addcart
 */
@WebServlet("/Addcart")
public class Addcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String oldprice=request.getParameter("oldprice");
		String category=request.getParameter("cat");
		String company=request.getParameter("cmp");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="insert into Cart values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,name);
			ps.setString(2,price);
			ps.setString(3,oldprice);
			ps.setString(4,category);
			ps.setString(5,company);
			ps.setString(6, id);
			int i=ps.executeUpdate();
			if(i>0)
			{	
			RequestDispatcher rd=request.getRequestDispatcher("Showcart");
			rd.include(request, response);
			out.println("Data added");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Uhome");
				rd.include(request, response);
				out.println("Record Not Added");
				
			}
		}
		catch (Exception e) 
		{
			out.println(e);
		}
		
	}

}
