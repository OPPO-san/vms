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
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Nurizzati
 */

public class calculateTotal extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                        
                // APPROACH 3 : USE UTILITIES Class
            final String serverName= "localhost";
            final String databaseName= "vms";
            String username = "root"; // Username/password required
            String password = ""; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);

            String []spare_part = request.getParameterValues("sparePart");
            String siri_num = request.getParameter("siri_num");
            Float cost = new Float(0.0);
            
            try {
            // Load database driver if it's not already loaded.
            Class.forName(driver);
              // Establish network connection to database.
            Connection connection =
              DriverManager.getConnection(url, username, password);
            // Look up info about the database as a whole.
            
            for(int i=0;i<spare_part.length;i++)
            {
                String sql = "SELECT COST FROM SPARE_PART WHERE SPAREPART_ID='"+spare_part[i]+"'";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                cost += rs.getFloat(1);
            }

            for(int i=0;i<spare_part.length;i++)
            {
                String sql = "UPDATE SPARE_PART SET QUANTITY=QUANTITY-1 WHERE SPAREPART_ID='"+spare_part[i]+"'";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.executeUpdate();             
            }
                        
        String query1 = "INSERT INTO SERVICE (SERVICE_COST, SIRI_NUM, PAYMENT) VALUES (?,?,?)";
        PreparedStatement insertService = connection.prepareStatement(query1);
        insertService.setFloat(1,cost);
        insertService.setString(2, siri_num);
        insertService.setString(3, "null");
        insertService.executeUpdate();

        System.out.println("New Maintenance Record has been added in database");

        response.sendRedirect("vehicleMaintenance.jsp");
  // Print results.
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
}
