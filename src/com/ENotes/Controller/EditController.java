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
 * Servlet implementation class EditController
 */
@WebServlet("/editNotes")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NotesDAO notesDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditController() {
		super();
		notesDAO = new NotesDAO();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int noteid = Integer.parseInt(request.getParameter("noteId"));
		String title = request.getParameter("title");
		String content = request.getParameter("contents");
		int userId = Integer.parseInt(request.getParameter("userId"));

		NotesBean notes = new NotesBean();
		notes.setId(noteid);
		notes.setTitle(title);
		notes.setContents(content);
		notes.setUserId(userId);

		boolean finalEdit = notesDAO.editNotes(notes);
		HttpSession session = request.getSession();
		if (finalEdit) {
			System.out.println("Notes is available:- " + notes);
			session.setAttribute("successMssg", "Notes updated successfully...... ");
			response.sendRedirect("viewNotes.jsp");
		} else {
			System.out.println("Notes is not available:- " + notes);
			session.setAttribute("errorMssg", "Something went wrong.Please try again...... ");
			response.sendRedirect("editNotes.jsp?nid=" + noteid);
		}
	}

}
