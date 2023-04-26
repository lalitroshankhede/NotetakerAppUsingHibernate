package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

 
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		try {
			
			//title,content fetch
			
		String title=request.getParameter("title_note");
		String content=	request.getParameter("content_note");
			
		Note note=new Note(title,content,new Date());
		
		
		//hibernate save();
		 
		FactoryProvider obj=new FactoryProvider();
	Session session=obj.getFactory().openSession();
		Transaction trans=session.beginTransaction();
	
		session.save(note);
	trans.commit();
	session.close();
	
	// to print message on the browser
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	out.println("<h1 style='text-align:center;'>Note is Added Succesfully</h1>");
	out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes<a></h1>");
	
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		 
	}

}
