

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Aregs
 */
@WebServlet("/Aregs")
public class Aregs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Aregs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String img=request.getParameter("file");
		String Fname=request.getParameter("first-name");
		String Lname=request.getParameter("last-name");
		String email=request.getParameter("email");
		String cont=request.getParameter("mob");
		String add=request.getParameter("address");
		String pwd=request.getParameter("pwd");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String query="select * from admin";
			Statement state=con.createStatement();
			ResultSet result=state.executeQuery(query);
			if(result.next())
			{	
				out.println("Only One Admin at a time");
			}
			else
			{
			
			String qr="Insert into Admin values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,Fname);
			ps.setString(2,Lname);
			ps.setString(3,email);
			ps.setString(4,cont);
			ps.setString(5,pwd);
			ps.setString(6,add);
			ps.setString(7,img);
			
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Admin.html");
				rd.include(request, response);
				out.println("<script>window.alert('signed up successfully');</script>");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Aregs.jsp");
				rd.include(request, response);
				out.println("<script>window.alert('registration failed');</script>");
			}
			con.close();
		
				
			}
		}
		
		catch (Exception e) 
		{
			
			out.println(e);
		}
	}

}
