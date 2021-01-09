

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
 * Servlet implementation class Aupdatepass
 */
@WebServlet("/Aupdatepass")
public class Aupdatepass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Aupdatepass() {
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
		session.removeAttribute("msg");
			String Id=(String) session.getAttribute("id1");
		String password=request.getParameter("pwd");
		if(!(StringUtils.isNullOrEmpty(Id) && StringUtils.isNullOrEmpty(password))){
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
		String qr="Update admin set password=? where email=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, password);
		ps.setString(2, Id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			session.setAttribute("msg", "<div class='order-details'style=' position:relative; width: 40%; text-align: center; left: 30%;'><h3>&#10003; Password Updated Successfully.</h3></div><br>");
			response.sendRedirect("Admin.jsp");
			
		}
		else 
		{	
			
		 	RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
			rd.include(request, response);
		
		}
		con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		}
		else{
			session.setAttribute("msg", "");
		 	RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
			rd.include(request, response);
}
	}
}