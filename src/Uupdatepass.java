

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

import com.mysql.jdbc.StringUtils;

/**
 * Servlet implementation class Uupdatepass
 */
@WebServlet("/Uupdatepass")
public class Uupdatepass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uupdatepass() {
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
		String Id=(String) session.getAttribute("id");
		String password=request.getParameter("pwd");
		if(!(StringUtils.isNullOrEmpty(Id) && StringUtils.isNullOrEmpty(password))){
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
		String qr="Update User set password=? where email=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, password);
		ps.setString(2, Id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			session.setAttribute("msg1", "<div class='order-details'style=' position:relative; width: 40%; text-align: center; left: 30%;'><h3>&#10003; Password Updated Successfully.</h3></div><br>");
			response.sendRedirect("Ulogin.jsp");
			
		}
		else 
		{	
			
		 	RequestDispatcher rd=request.getRequestDispatcher("Ulogin.jsp");
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
			session.setAttribute("msg1", "");
		 	RequestDispatcher rd=request.getRequestDispatcher("Ulogin.jsp");
			rd.include(request, response);
}
	}
}