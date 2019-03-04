package Servlet;

import java.net.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetUrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetUrl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String address = request.getParameter("address");
//		String sid = request.getParameter("sid");
		// split address string
		String[] splitAddress = address.split("\\s+");
		int i = 0;
		StringBuilder sb = new StringBuilder();
		System.out.println("sb ");
		int la = splitAddress.length;
		while (i < la) {
			sb.append(splitAddress[i]);
			sb.append("%20");
			System.out.println(sb);
			i = i + 1;
		}

		response.getWriter().println(address);

		URL oracle = new URL("https://plus.codes/api?address=" + sb + "&ekey=AIzaSyCXs_YJYqMk2lgMhY3m7BUPItkQBpDzRzc");
		System.out.println("OOOOO" + oracle);
		BufferedReader in = new BufferedReader(new InputStreamReader(oracle.openStream()));

		String inputLine;
		System.out.println("input1");
		int n = 0;
		while ((inputLine = in.readLine()) != null) {

			if (n == 2) {
				StringBuilder sb1 = new StringBuilder();
				int x = inputLine.length();

				for (int j = 20; j <= 27; j++) {
					sb1.append(inputLine.charAt(j));

				}
				sb1.append("%2B");
				
				/*update pluscode column from null to specific pluscode*/
				try
				{	
					HttpSession session=request.getSession();
					String sid = request.getParameter("sid");
					String address1 = request.getParameter("address");
					System.out.println("------------------------------------"+address1+"ssss"+sid);
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","root");
					PreparedStatement ps=conn.prepareStatement("update sticky"+((String) session.getAttribute("email")).split("@")[0]+" set pluscode = '" + sb1 + "' where address='" + address1 + "'");
					String page1="";
					
					int k=ps.executeUpdate();

					if(k!=0)
					{
						System.out.println("success");
					}
					else
					{
						System.out.println("failed");
					}
		}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
				//System.out.println(sb1);
			}
			n = n + 1;
		}
		in.close();
		
	}

}
