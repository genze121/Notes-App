package com.ENotes.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ENotes.Model.NotesDAO;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/delete")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NotesDAO notesDAO;

	public DeleteController() {
		super();
		notesDAO = new NotesDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int noteid = Integer.parseInt(request.getParameter("nid"));

		boolean finalDelete = notesDAO.deleteNotes(noteid);
		HttpSession session = request.getSession();
		if (finalDelete) {
			session.setAttribute("successMssg", "Notes deleted successfully...... ");
			response.sendRedirect("viewNotes.jsp");
		} else {
			session.setAttribute("errorMssg", "Something went wrong.Please try again...... ");
			response.sendRedirect("viewNotes.jsp");
		}
	}

}
