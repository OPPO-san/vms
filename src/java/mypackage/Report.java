/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import db.DriverUtilities;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmad Tahfiz
 */
@WebServlet(name = "Report", urlPatterns = {"/Report"})
public class Report extends HttpServlet {

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
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\"\n";
    String title = "Vehicle Report";
    out.print(docType +
              "<HTML>\n" +
              "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n" +
              "<BODY><CENTER>\n" +
              "<H1>Vehicle Details Report</H1>\n");
   
    final String serverName= "localhost";
    final String databaseName= "vms";
    String username = "root"; // Username/password required
    String password = ""; // for MSSQL SERVER.
    DriverUtilities.loadDrivers();   
    String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
    String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
//*/   
    String month = null;
    String year = null;
    
    if(request.getParameter("month")!=null)
        month = request.getParameter("month");
    
    year = request.getParameter("year");
    
    showTable(driver, url, username, password,out, year, month);    
    
    out.println("</CENTER></BODY></HTML>");
  }
  
    public void showTable(String driver, String url,
                        String username, String password,
                        PrintWriter out, String year, String month) {
    try {
      // Load database driver if it's not already loaded.
      Class.forName(driver);
      // Establish network connection to database.
      Connection connection =
        DriverManager.getConnection(url, username, password);
     
      Statement statement = connection.createStatement();

      String query = "SELECT * FROM maintenance WHERE MONTH(DATE_OF_MAINTENANCE)= 12 AND YEAR(DATE_OF_MAINTENANCE)=2014";
    // Send query to database and store results.
      PreparedStatement selectInfo = connection.prepareStatement(query);
      selectInfo.setString(1,month);
      selectInfo.setString(2,year);
      ResultSet resultSet = selectInfo.executeQuery();
      
      System.out.println("Successful display result");
      // Print results.
      out.println("<TABLE class=\"table table-hover\">");
      out.println("<THEAD><th>No<th>Date<th><th>Description</th></THEAD>");
      out.println("<TBODY>");
      while(resultSet.next()){
        out.println("<TR>");
        out.println("<TD><TD>"+ resultSet.getString("DATE_OF_MAINTENANCE") + "<TD>"+ resultSet.getString("MAINTENANCE_TYPE") );
        out.println("</TD></TR>");
      }
      out.println("</TBODY></TABLE>");
      connection.close();
    } catch(ClassNotFoundException cnfe) {
      System.err.println("Error loading driver: " + cnfe);
    } catch(SQLException sqle) {
      System.err.println("Error connecting: " + sqle);
    } catch(Exception ex) {
      System.err.println("Error with input: " + ex);
    }
  }
 }