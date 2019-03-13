package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InsertServlet
 */
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String start_date=request.getParameter("start_date");
		String end_date=request.getParameter("end_date");
		String status=request.getParameter("status");
		String message=request.getParameter("message");
		String address=request.getParameter("address");
		
		
		String page1="";
		
		try
		{	HttpSession session=request.getSession();
			System.out.println("into connection "+message+" "+address);
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","root");
			//Connection conn=DriverManager.getConnection("jdbc:mysql://admin:UUOCDSNSTWXZUTTE@sl-eu-gb-p04.dblayer.com:17649/inventory");
			PreparedStatement ps=conn.prepareStatement("insert into sticky"+((String) session.getAttribute("email")).split("@")[0]+"(start_date,end_date,status,message,address) values ('"+start_date+"','"+end_date+"','"+status+"','"+message+"','"+address+"')");

			
			int i=ps.executeUpdate();
			//resultset is an interface an it behave like an aary but it srore any types of data

			if(i!=0)
			{
				page1="StickyNote.jsp?msg=success";
			}
			else
			{
				page1="error.jsp?msg=failed";
			}
}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
