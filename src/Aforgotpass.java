

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.StringUtils;

/**
 * Servlet implementation class Aforgotpass
 */
@WebServlet("/Aforgotpass")
public class Aforgotpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Aforgotpass() {
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
		session.removeAttribute("msg1");
		String id=request.getParameter("email");
		if(!StringUtils.isNullOrEmpty(id)){
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
		String qr="select * from admin where email=? ";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			
			session.setAttribute("i1", id);
			response.sendRedirect("Aupdatepass.html");
			
		}
		else 
		{	
			session.setAttribute("msg1", "<div class='order-details'style=' position:relative; width: 40%; text-align: center; left: 30%;'><h3>&#9888; Wrong ID</h3></div><br>");
		 	RequestDispatcher rd=request.getRequestDispatcher("Aforgotpass.jsp");
			rd.include(request, response);
		
		}
		con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		}else{
			session.setAttribute("msg1", "");

		 	RequestDispatcher rd=request.getRequestDispatcher("Aforgotpass.jsp");
			rd.include(request, response);

			
			
		}
	}

}
