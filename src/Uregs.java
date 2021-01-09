

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
import javax.websocket.Session;

/**
 * Servlet implementation class Uregs
 */
@WebServlet("/Uregs")
public class Uregs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uregs() {
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
		String Fname=(String)session.getAttribute("Fname");
		String Lname=(String)session.getAttribute("Lname");
		String cat=(String)session.getAttribute("cat");
		String email=(String)session.getAttribute("email");
		String add=(String)session.getAttribute("add");
		String city=(String)session.getAttribute("city");
		String pin=(String)session.getAttribute("pin");
		String country=(String)session.getAttribute("country");
		String mob=(String)session.getAttribute("mob");
		String img=(String)session.getAttribute("img");
		String pwd=(String)session.getAttribute("pwd");
	
		
		
		
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
		String qr="insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, Fname);
		ps.setString(2, Lname);
		ps.setString(3, cat);
		ps.setString(4, email);
		ps.setString(5, add);
		ps.setString(6, city);
		ps.setString(7, pin);
		ps.setString(8, country);
		ps.setString(9, mob);
		ps.setString(10, pwd);
		ps.setString(11, img);
		int i=ps.executeUpdate();
		if(i>0)
		{	
		
			RequestDispatcher rd=request.getRequestDispatcher("Ulogin.jsp");
			rd.include(request, response);
			out.println("<script>window.alert('signed up successfully');</script>");
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("Uregs.html");
			rd.include(request, response);
			out.println("<script>window.alert('registration failed');</script>");
		}
		con.close();
		}catch(Exception e)
		{
			out.println(e);
		}
	}
	}


