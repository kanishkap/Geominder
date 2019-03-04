package Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("username");
		String password = request.getParameter("password");
		String page = " ";
		System.out.println(email + " " + password);

		if (email.equals("") || password.equals("")) {
			page = "error.jsp?msg=can'tnull";
		} 
		else {
			System.out.println("else part");

			String key = "select * from register where email='" + email + "' and pass='" + password + "'";

			ResultSet resultSet;
			try {
				resultSet = Dao.select(key);

				if (resultSet.next()) {
					session.setAttribute("email", email);
					System.out.println(session.getAttribute("email"));
					request.setAttribute("success","Login Successfull");
					page = "MyNote.jsp";
					
				} else {
					System.out.println("error");
					request.setAttribute("error","Invalid Login");
					request.getRequestDispatcher("login.jsp").forward(request, response);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		response.sendRedirect(page);

	}

}
