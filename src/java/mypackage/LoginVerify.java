/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;
import db.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.DateFormat;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;


/**
 *
 * @author MPK05
 */
public class LoginVerify extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                        
                // APPROACH 3 : USE UTILITIES Class
            final String serverName= "localhost";
            final String databaseName= "vms";
            String username = "root"; // Username/password required
            String password = ""; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
            
            String user = null;
            String pwd = null;
            
            boolean loginSuccess = false;
            User userlogin = null;
            HttpSession session = request.getSession(true);
            if (request.getHeader("referer") == null)
            {
                session.invalidate();
                RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
                rd.forward(request, response);
            }
//            System.out.println(request.getHeader("referer").toString());
            if (request.getHeader("referer").contains("login.jsp"))
            //if (request.getRequestURI().contains("Login.html"))
            {
                user = request.getParameter("username");
                pwd = request.getParameter("password");
                userlogin = verifyCustomer(driver, url, username, password,out, user,pwd); 
                if (userlogin != null)
                {
                    loginSuccess = true;
                    //INSERT user info into session
                    session.setAttribute("user", userlogin);
                    
                    Date d1 = new Date();
                    session.setAttribute("logintime", d1);
                }
            }
            else
                userlogin = (User) session.getAttribute("user");
//            if (userlogin.getUsername().length()>0)
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");           
            out.println("</head>");
            out.println("<body>");
            
            if (userlogin != null)
            {
                if(userlogin.getLevel()==1)
                    response.sendRedirect("admin.jsp");
                else
                    response.sendRedirect("index.jsp");
            }
            else    
            {
                request.setAttribute( "error", "Invalid username or password");
                response.sendRedirect("login.jsp");
            }
                out.println("</body>");
            out.println("</html>");
        }
    }
    
     public User verifyCustomer(String driver, String url,
                        String username, String password,
                        PrintWriter out, String userid, String userpass) {
    
      User userlogin = null;
      try {
      // Load database driver if it's not already loaded.
      Class.forName(driver);
      // Establish network connection to database.
      Connection connection =
        DriverManager.getConnection(url, username, password);
      // Look up info about the database as a whole.

      //USE STATEMENT
/*      String query = "SELECT * FROM user WHERE username='" + userid +"'";
      query = query + "AND password='" + userpass +"'";
      // Send query to database and store results.
      Statement statement = connection.createStatement();
      ResultSet resultSet = statement.executeQuery(query);
*/ 
      //USE PREPAREDSTATEMENT
      String query2 = "SELECT * FROM users WHERE staffID=? AND password=?";
      PreparedStatement selectCust = connection.prepareStatement(query2);
      selectCust.setString(1,userid);
      selectCust.setString(2,userpass);
      ResultSet resultSet = selectCust.executeQuery();
      
      if (resultSet.next())
      {
         userlogin = new User(resultSet.getString("staffID"),resultSet.getString("password"),resultSet.getString("fullName"),
                               resultSet.getInt("userLevel"));
          
          //use to debug
 /*         System.out.println("  <LI><B>Customerid:</B> " + userlogin.getCustomerID() +
                  "  <LI><B>username:</B> " + userlogin.username +
                  "</UL>");
 */
       }         
// Print results.
      connection.close();
    } catch(ClassNotFoundException cnfe) {
      System.err.println("Error loading driver: " + cnfe);
    } catch(SQLException sqle) {
      System.err.println("Error connecting: " + sqle);
    } catch(Exception ex) {
      System.err.println("Error with input: " + ex);
    }
         
    return userlogin;
    
  }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
