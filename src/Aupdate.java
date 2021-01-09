

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
 * Servlet implementation class Aupdate
 */
@WebServlet("/Aupdate")
public class Aupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Aupdate() {
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
		String cont=request.getParameter("cont");
		String email=request.getParameter("email");
		String add=request.getParameter("add");
		String img=request.getParameter("img");
		String pwd=request.getParameter("pwd");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="Update Admin set L_Name=?, Email=?, Cont=?, Password=?,Address=?,Image=? where F_Name=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,lname);
			ps.setString(2,email);
			ps.setString(3,cont);
			ps.setString(4,pwd);
			ps.setString(5,add);
			ps.setString(6,img);
			ps.setString(7,fname);
			int i=ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Adminaccount.jsp");
				rd.include(request, response);
				out.println("Data Updated");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Aupdate.html");
				rd.include(request, response);
				out.println("Data not Updated");
			}
		} catch (Exception e) 
		{
			out.println(e);
		}
	}

}