
package mypackage;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class display_vehicle {
    public static ResultSet DBConnection(String sql) throws SQLException
    {
        final String DB_URL = "jdbc:mysql://localhost:3306/vms?zeroDateTimeBehavior=convertToNull";
       
        Connection conn=null;
        Statement stmt =null;
        ResultSet rs;
        
       
            //Connect to driver
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(display_vehicle.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //Making database connection
            conn = DriverManager.getConnection(DB_URL, "root","");
            stmt =  conn.createStatement();
            rs=stmt.executeQuery(sql);                   
            return rs;
    }
}
