package Servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String start_date= request.getParameter("start_date");
		String end_date= request.getParameter("end_date");
		String status = request.getParameter("status");
		String message = request.getParameter("message");
		String address = request.getParameter("address");
		String sid = request.getParameter("sid");
		
		/*start of location code */
		
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
				
				/*end of location code */
				
				/*insert */
				try
				{	
					HttpSession session=request.getSession();
//					String sid = request.getParameter("sid");
					String address1 = request.getParameter("address");
					System.out.println("------------------------------------a1"+address1+"ssss"+sid+"address"+address);
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","root");
					//	Connection conn=DriverManager.getConnection("jdbc:mysql://admin:UUOCDSNSTWXZUTTE@sl-eu-gb-p04.dblayer.com:17649/inventory");
					PreparedStatement ps = conn.prepareStatement(
							"update sticky"+((String) session.getAttribute("email")).split("@")[0]+" set start_date = '" + start_date  + "',end_date  = '" + end_date
									+ "',status= '" + status+ "',message = '" + message+ "',address = '" + address+"',pluscode = '" + sb1+ "'where sid='" + sid + "'");
					String page1="";
					
					int k=ps.executeUpdate();
					//resultset is an interface an it behave like an aary but it srore any types of data

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
				
				System.out.println(sb1);
			}
//			System.out.println(inputLine);
			n = n + 1;
		}
		in.close();
}
}