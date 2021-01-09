

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		MultipartRequest m = new MultipartRequest(request, "C:/Users/hp/Desktop/Shoppe/WebContent/ProductsImg/");  
		if(m!=null)
		{
			RequestDispatcher rd=request.getRequestDispatcher("Adminhome.html");
			rd.include(request, response);
			out.println("<script>window.alert('Successfully Uploaded');</script>");
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("Adminhome.html");
			rd.include(request, response);
			out.println("<script>window.alert('Not Uploaded');</script>");
		}
	}

}
