

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Asignout
 */
@WebServlet("/Asignout")
public class Asignout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Asignout() {
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
		String email=(String) session.getAttribute("id1");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="Delete from Admin where email='"+email+"'";
			Statement st=con.createStatement();
			int i=st.executeUpdate(qr);
			if(i>0)
			{
				response.sendRedirect("Admin.jsp");
			}
			else
			{
				response.sendRedirect("Adminhome.html");
			}
		} 
		catch (Exception e)
		{
			out.println(e);
		}
		
	}

}
