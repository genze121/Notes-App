package com.ENotes.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ENotes.Bean.UserBean;
import com.ENotes.Model.LoginDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private LoginDAO loginDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		loginDAO = new LoginDAO();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password_");

		UserBean user = loginDAO.loginUser(username, password);
		HttpSession session = request.getSession();
		if (user != null) {
			System.out.println("User is available:- " + user);
			session.setAttribute("user", user);
			response.sendRedirect("home.jsp");
		} else {
			System.out.println("User is not available:- " + user);
			session.setAttribute("errorMssg", "Something went wrong.Please try again....");
			response.sendRedirect("login.jsp");
		}
	}

}
