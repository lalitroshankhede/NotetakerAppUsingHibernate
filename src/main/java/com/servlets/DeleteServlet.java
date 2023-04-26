package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	 // use doGet () method insted of doPost() because we want to get Id from Note class thats why
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 
		try {
			
			// to Delete Note
			
			int noteId=Integer.parseInt(request.getParameter("note_id"));
			
			FactoryProvider obj=new FactoryProvider();
			
			Session session2=obj.getFactory().openSession();
		    
			Transaction trans=session2.beginTransaction();
			
			
			Note note=(Note)session2.get(Note.class, noteId);
			session2.delete(note);
			
			trans.commit();
			
			session2.close();
			
			response.sendRedirect("all_notes.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	 

}
