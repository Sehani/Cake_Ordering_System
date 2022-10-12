package com.app;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/registerInput")


public class registerInput extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String name, address, email, password;
	int cID=0;
	
	
   
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
	
		name=request.getParameter("name");
		//out.println(name);
		password=request.getParameter("password");
		//out.println(password);
		address=request.getParameter("address");
		//out.println(address);
		email=request.getParameter("email");
		//out.println(email);
		
		response.setContentType("text/html");  
		
		          
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			
			Connection con=DriverManager.getConnection(  
				"jdbc:mysql://127.0.0.1:3306/dreamcake?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","");  
			
			PreparedStatement ps=con.prepareStatement(  
					"insert into users values(?,?,?,?,?)");  
			
			
			    ps.setInt(1, cID); 
				ps.setString(2, name);				
				ps.setString(3, email);
				ps.setString(4, password);
				ps.setString(5, address);
		 
		          
		int i=ps.executeUpdate();  
		 
//		out.print("You are successfully registered...");  
		if(i>0) 
		{
		response.sendRedirect("index.jsp");  
		}
		}catch (Exception e2) {System.out.println(e2);}  
		          
		out.close();  
		}  
		
		
		
		
		
}

