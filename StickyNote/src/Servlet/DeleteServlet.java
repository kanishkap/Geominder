package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("delete servlet call");
		response.getWriter().println(request.getParameter("sid"));
		HttpSession session=request.getSession();
		
		
		
		String sid = request.getParameter("sid");
		
		String page1="";
		try
		{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","root");
				
				PreparedStatement ps=conn.prepareStatement("delete from sticky"+((String) session.getAttribute("email")).split("@")[0]+" where sid='"+sid+"'");
				int i=ps.executeUpdate();
				
				if(i!=0)
				{
					page1="StickyNote.jsp?msg=success";
				}
				else
				{
					page1="Home.jsp?msg=failed";
				}
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}

			response.sendRedirect(page1);
	}
		
	}


