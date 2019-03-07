package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("usernamesignup");
		String email = request.getParameter("emailsignup");
		String pass = request.getParameter("passwordsignup");
		
		/*Dao dao=new Dao();
		try {
			Dao.create(fname, email, pass);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
		String sql = "insert into register values('" + fname + "','" + email + "','" + pass + "')";

		String tableName = "sticky" + email.split("@")[0];
		System.out.println("-------------" + tableName);

		String dynamicTable = "CREATE TABLE " + tableName
				+ "( sid int(10) not null auto_increment,start_date date,end_date date,status varchar(10),message varchar(500),address varchar(500),pluscode varchar(20),primary key(sid)) ";
		int i;
		int j;
		try {
			i = Dao.insert(sql);
			if (i != 0) {
				j = Dao.insert(dynamicTable);
				System.out.println(j);
				if (j <= 0) {
					response.sendRedirect("login.jsp");
					System.out.println("table created");
				} else {
					request.setAttribute("register_error","User already exists");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
