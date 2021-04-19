package com.ENotes.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ENotes.Bean.NotesBean;
import com.ENotes.Model.NotesDAO;

/**
 * Servlet implementation class AddNotesController
 */
@WebServlet("/addNotes")
public class AddNotesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NotesDAO notesDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNotesController() {
		super();
		notesDAO = new NotesDAO();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("contents");
		int userId = Integer.parseInt(request.getParameter("userId"));

		NotesBean notes = new NotesBean();
		notes.setTitle(title);
		notes.setContents(content);
		notes.setUserId(userId);

		boolean finalNotes = notesDAO.addNotes(notes);
		HttpSession session = request.getSession();
		if (finalNotes) {
			session.setAttribute("successMssg", "Notes added successfully....");
			response.sendRedirect("addNotes.jsp");
		} else {
			session.setAttribute("errorMssg", "Something went wrong.Please try again....");
			response.sendRedirect("addNotes.jsp");
		}

	}

}
