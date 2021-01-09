

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
 * Servlet implementation class Uupdate
 */
@WebServlet("/Uupdate")
public class Uupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String cat=request.getParameter("cat");
		String email=request.getParameter("email");
		String mob=request.getParameter("mob");
		String city=request.getParameter("city");
		String pin=request.getParameter("pin");
		String country=request.getParameter("country");
		String add=request.getParameter("add");
		String img=request.getParameter("img");
		String pwd=request.getParameter("pwd");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="Update User set Last_Name=?,Category=?, First_Name=?, Address=?, City=?,Pin_Code=?,Country=?,Mobile=?,Password=?,Image=? where Email=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,lname);
			ps.setString(2,cat);
			ps.setString(3,fname);
			ps.setString(4,add);
			ps.setString(5,city);
			ps.setString(6,pin);
			ps.setString(7,country);
			ps.setString(8,mob);
			ps.setString(9,pwd);
			ps.setString(10,img);
			ps.setString(11,email);
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("Uaccount.jsp");
				
				
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Uupdate.html");
				rd.include(request, response);
				out.println("Data not Updated");
			}
		} catch (Exception e) 
		{
			out.println(e);
		}
	}

}
