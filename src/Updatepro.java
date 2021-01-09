

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
 * Servlet implementation class Updatepro
 */
@WebServlet("/Updatepro")
public class Updatepro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatepro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String sno=request.getParameter("sno");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String oldprice=request.getParameter("oldprice");
		String cat=request.getParameter("cat");
		String sale=request.getParameter("sale");
		String subcat=request.getParameter("subcat");
		String cmp=request.getParameter("cmp");
		String img1=request.getParameter("img1");
		String img2=request.getParameter("img2");
		String img3=request.getParameter("img3");
		String img4=request.getParameter("img4");
		String status=request.getParameter("status");
		String detail=request.getParameter("detail");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinestore","root","root");
			String qr="Update  products set Name=?, price=?, oldprice=?, category=?, company=?,image=?,image2=?,image3=?,image4=?,status=?,Detail=?,SubCategory=?,Sale=? where Sno=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,name);
			ps.setString(2,price);
			ps.setString(3,oldprice);
			ps.setString(4,cat);
			ps.setString(5,cmp);
			ps.setString(6,img1);
			ps.setString(7,img2);
			ps.setString(8,img3);
			ps.setString(9,img4);
			ps.setString(10,status);
			ps.setString(11,detail);
			ps.setString(12,subcat);
			ps.setString(13,sale);
			ps.setString(14,sno);
			int i=ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Show.html");
				rd.include(request, response);
			
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Adminhome.html");
				rd.include(request, response);
				out.println("Data not Updated");
			}
		} catch (Exception e) 
		{
			out.println(e);
		}
	}

}
