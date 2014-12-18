package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateMileage extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String plate_num = request.getParameter("plate_num");
            String service_mileage = request.getParameter("service_mileage");
            String old_service_mileage = request.getParameter("old_service_mileage");
            String sql=null;
            
            if(old_service_mileage.equals("0"))
                 sql= "UPDATE VEHICLE "
                    + "SET SERVICE_MILEAGE='"+service_mileage+"' "
                    + "WHERE PLATE_NUM='"+plate_num+"'";
            else
                 sql= "UPDATE VEHICLE "
                    + "SET MILEAGE=SERVICE_MILEAGE, "
                    + "SERVICE_MILEAGE='"+service_mileage+"' "
                    + "WHERE PLATE_NUM='"+plate_num+"'";
            
            String message =null;
        
            try
            {
                DBConnection(sql);
            }
        
            catch(SQLException ex)
            {
                ex.printStackTrace();
                message="Update failed";
            }
        
            catch(Exception ex)
            {
                ex.printStackTrace();
                message="Update failed";
            }
        
            if(message!=null)
            {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) 
                {            
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet updateVehicle</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>"+message+"</h1>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
            else
                response.sendRedirect("display_maintenance.jsp");
        }
    
     public void DBConnection(String sql) throws SQLException
    {
       try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addVehicle.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        final String DB_URL = "jdbc:mysql://localhost:3306/vms?zeroDateTimeBehavior=convertToNull";
       
        Connection conn=null;
        Statement stmt =null;
        
        //Database connecgtion
        conn = DriverManager.getConnection(DB_URL, "root", "");
        stmt=conn.createStatement();
        stmt.executeUpdate(sql);
        
                if(stmt!=null){
                    stmt.close();
                }
                  
                if(conn!=null){
                    conn.close();
            }
                
    }
}
