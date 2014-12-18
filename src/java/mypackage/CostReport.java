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
public class CostReport extends HttpServlet {

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
    String year;
    
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
     
      System.out.println(year);
      System.out.println(month);
      Statement statement = connection.createStatement();

      String query = "SELECT SERVICE_ID FROM maintenance WHERE MONTH(DATE_OF_MAINTENANCE) = 12 AND YEAR(DATE_OF_MAINTENANCE) = 2014";
    // Send query to database and store results.
      PreparedStatement selectID = connection.prepareStatement(query);
      selectID.setString(1,month);
      selectID.setString(2,year);
      ResultSet resultID = selectID.executeQuery();
      
      String id = null;
      String platNum = null;
      if(resultID.next()){
          id = resultID.getString("SERVICE_ID");
          platNum = resultID.getString("PLATE_NUM");
      }
          
      System.out.println(resultID.getString("MONTH(DATE_OF_MAINTENANCE)"));
      
      String query2 = "SELECT * FROM service WHERE SERVICE_ID="+ id ;
      PreparedStatement selectCost = connection.prepareStatement(query2);
      ResultSet resultCost = selectCost.executeQuery();
      // Print results.
      out.println("<TABLE class=\"table table-hover\">");
      out.println("<THEAD><th>No<th>Plat Num<th>Cost</th></THEAD>");
      while(resultCost.next()){
        out.println("<TBODY><TR>");
        out.println("<TD><TD>"+ platNum + "<TD>" + resultCost.getString("SERVICE_COST"));
      }
      out.println("</TD></TR></TBODY></TABLE>");
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