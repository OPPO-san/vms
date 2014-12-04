/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;

/**
 *
 * @author Ahmad Tahfiz
 */
public class ConnectDB {
    public static void main(String[] args){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost/mysql?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);
        }catch(SQLException e){
            System.out.println("SQL Exception: "+ e.toString());
        }catch(ClassNotFoundException cE){
            System.out.println("Class Not Found Exception: "+ cE.toString());
        }
    }
}
