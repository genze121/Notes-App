package com.ENotes.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ENotes.Bean.UserBean;
import com.ENotes.Model.RegisterDAO;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RegisterDAO userDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterController() {
		super();
		userDAO = new RegisterDAO();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String checkbox = request.getParameter("checkBox");
		HttpSession session = request.getSession();
		if (checkbox == null) {
			session.setAttribute("checkMssg", "Please Register first.....");
			response.sendRedirect("register.jsp");
		} else {
			String firstname = request.getParameter("first_name");
			String lastname = request.getParameter("last_name");
			String username = request.getParameter("username");
			String password = request.getParameter("password_");

			UserBean user = new UserBean(firstname, lastname, username, password);
			boolean registerFinal = userDAO.registerUser(user);

			if (registerFinal) {
				session.setAttribute("successMssg", "Registered successfully.....");
				response.sendRedirect("register.jsp");
			} else {
				session.setAttribute("errorMssg", "Something went wrong.Please try again.....");
				response.sendRedirect("register.jsp");
			}
		}

	}

}
