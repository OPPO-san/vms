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

public class updateVehicle extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String plateNum = request.getParameter("plate_num");
        String driver = request.getParameter("driver");
        String type = request.getParameter("type");
        String model = request.getParameter("model");
        String mileage = request.getParameter("mileage");
        String service_mileage = request.getParameter("service_mileage");
        String vehicle_status = request.getParameter("status");
        String date = request.getParameter("date");
        
        String sql = "UPDATE VEHICLE "
                + "SET DRIVER='"+driver+"', DATE_OF_RELEASE='"+date+"', TYPE_ID=(SELECT TYPE_ID FROM VEHICLE_TYPE WHERE VEC_TYPE='"+type+"'), "
                + "MODEL='"+ model+"', MILEAGE='"+ mileage+"', SERVICE_MILEAGE='"+ service_mileage+"', VEC_STATUS='"+ vehicle_status+"' "
                + "WHERE PLATE_NUM='"+plateNum+"'";
        
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
            try (PrintWriter out = response.getWriter()) {            
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
