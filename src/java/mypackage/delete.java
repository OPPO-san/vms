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

public class delete extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String plate_num = request.getParameter("plate_num");
            
            String sql = "DELETE FROM VEHICLE WHERE PLATE_NUM='"+plate_num+"'";
            
           try
            {
                DBConnection(sql);
            }
            
            catch(SQLException ex)
            {
                ex.printStackTrace();
            }
            
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
            
            
           response.sendRedirect("display_vehicle.jsp");
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
