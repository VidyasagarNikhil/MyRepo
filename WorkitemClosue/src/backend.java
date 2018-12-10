
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class backend
 */
@WebServlet("/backend")
public class backend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   String id=request.getParameter("id");
	   String status=request.getParameter("status");
	   String queue[]=request.getParameterValues("queue");
   	System.out.println("The id no. is: "+id);
   	System.out.println("The status no. is: "+status);
   	System.out.println("The queue name is: "+queue);
   	request.getSession().setAttribute("id",id);
   	request.getSession().setAttribute("queue",queue);

   	
   	theQuery(status, id,queue);
   	response.sendRedirect("jsp/display.jsp");   
	}
   public void theQuery(String status,String id,String[] queue) {
	   
	   
			      Connection con = null;
			      Statement st = null;
			       
			      try {
			    	   Class.forName("com.mysql.jdbc.Driver");
			    	   
			    	}
			    	catch(ClassNotFoundException ex) {
			    	   System.out.println("Error: unable to load driver class!");
			    	   System.exit(1);
			    	}
			      try{
			          con = DriverManager.getConnection("jdbc:mysql://localhost/bancs-ca-prod","root","vidya@123");  
			         st = con.createStatement();
			          String res="";
			         for(int i=0;i<queue.length;i++){
			        	 res=queue[i];
			        	 System.out.println(res);
			          String query="update workitem set status = '"+status+"' where wk_id ="+id+" and queue='"+res+"'";
			          st.executeUpdate(query);
			       
			         }
			          //st.executeUpdate(query);
			          JOptionPane.showMessageDialog(null,"Query Executed");
			          con.close();
			        
			      }catch(Exception ex){
			          JOptionPane.showMessageDialog(null,ex.getMessage());
			      }
   }   
}
   

   
