package Servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FetchUrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StringBuilder finalstr = new StringBuilder();
	public FetchUrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


				/*update pluscode column from null to specific pluscode*/
				try
				{	Connection connection = null;
					HttpSession session=request.getSession();					
					String address2 = request.getParameter("address");
					String latitude=request.getParameter("latitude");
					String longitude=request.getParameter("longitude");
					
					String email = (String) session.getAttribute("email");
					String sql = "select * from sticky" + email.split("@")[0];
					System.out.println("----------------------------lat"+latitude+"long"+longitude);
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","root");
					
					int i = 0;
					StringBuilder sb = new StringBuilder();
					System.out.println("FETCHURL-------------------- ");
					sb.append(latitude);
					sb.append(",");
					sb.append(longitude);
					System.out.println(sb);

					response.getWriter().println(address2);
					URL oracle = new URL("https://plus.codes/api?address=" + sb + "&ekey=AIzaSyCXs_YJYqMk2lgMhY3m7BUPItkQBpDzRzc");
					System.out.println("OOOOO" + oracle);
					BufferedReader in = new BufferedReader(new InputStreamReader(oracle.openStream()));

					String inputLine;
					System.out.println("input1");
					int n = 0;
					
					while ((inputLine = in.readLine()) != null) 
					{

						if (n == 2) 
						{
							StringBuilder sb1 = new StringBuilder();
							int x = inputLine.length();
							for (int j = 20; j <= 27; j++) 
							{
								sb1.append(inputLine.charAt(j));
							}
							sb1.append("%2B");							
							finalstr=sb1;
						}
						n = n + 1;
						
					}					
					System.out.println("----------------------"+finalstr);					
					PreparedStatement ps=conn.prepareStatement(sql);
					
					ResultSet rs = ps.executeQuery();
					System.out.println("RS --------");

					while (rs.next()) 
					{
						String sid = rs.getString(1);
						String start_date = rs.getString(2);
						String end_date = rs.getString(3);
						String status = rs.getString(4);
						String address = rs.getString(6);
						String pluscode = rs.getString(7);
						System.out.println("inside while --------");
						System.out.println("sid:"+sid);
						System.out.println("sdate:"+start_date);
						System.out.println("edate:"+end_date);
						System.out.println("status:"+status);
						System.out.println("addrss:"+address);
						System.out.println("pluscode:"+pluscode);
						
						/* converting string builder into string using toString() */
						String ns=finalstr.toString(); 
						
						if(pluscode.equals(ns))
						{
							System.out.println("YES at "+address+pluscode+finalstr);							
						}
						else
						{							
							System.out.println("No at "+address+pluscode+finalstr);
						}
						
					}				
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
//				in.close();
	
	}

}

