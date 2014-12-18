package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class addVehicle extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        
        String plateNum = request.getParameter("plateNum");
        String driver = request.getParameter("driver");
        String type = request.getParameter("type");
        String model = request.getParameter("model");
        String mileage = request.getParameter("mileage");
        String service_mileage = request.getParameter("service_mileage");
        String vehicle_status = request.getParameter("status");
        String date = request.getParameter("date");
        
        String sql = "INSERT INTO VEHICLE(PLATE_NUM, DRIVER, DATE_OF_RELEASE, TYPE_ID, MODEL, MILEAGE, SERVICE_MILEAGE, VEC_STATUS)"
                + "VALUES('"
                + plateNum+"','"
                + driver+"','"
                + date+"',"
                + "(SELECT TYPE_ID FROM VEHICLE_TYPE WHERE VEC_TYPE='"+type+"'),'"
                + model+"','"
                + mileage+"','"
                + service_mileage+"','"
                + vehicle_status+"'"
                +")";
        
        String message="Successfully add vehicle";
        
        try
        {
            DBConnection(sql);
        }
        
        catch(SQLException ex)
        {
            ex.printStackTrace();
            message="Failed to add vehicle";
        }
        
        catch(Exception ex)
        {
            ex.printStackTrace();
            message="Failed to add vehicle";
        }
        
        if(message.equals("Failed to add vehicle"))
        {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            out.println("<DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>"+message+"</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>"+message+"</h1>");
            out.println("Click <a href=./addVehicle.java>here</a> to return.");
        }
        
        else
            response.sendRedirect("./display_vehicle.jsp");
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
