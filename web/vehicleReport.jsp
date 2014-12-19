<%-- 
    Document   : reportMonthly
    Created on : Dec 19, 2014, 10:44:08 AM
    Author     : Ahmad Tahfiz
--%>
<jsp:include page="Header.jsp" />
<%@ page import="java.sql.*" %>
<%@ page import="db.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Report</title>
    </head>
    <body>
        <%
            final String serverName= "localhost";
            final String databaseName= "vms";
            String username = "root"; // Username/password required
            String password = ""; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
            
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            
            String query = "SELECT * FROM vehicle";
            PreparedStatement selectInfo = connection.prepareStatement(query);
            ResultSet resultSet = selectInfo.executeQuery();
        %>
        <div class="container">
            <div class="row">
                <% while(resultSet.next()){
                        int i = 1;
                %>
                <table class="table table-bordered">
                    <thead>
                        <th>No<th>Plat Number<th>Instructor<th>Year</th></th>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%= i++ %></td>
                            <td><%= resultSet.getString("PLATE_NUM")%></td>
                            <td><%= resultSet.getString("DRIVER") %></td>
                            <td><%= resultSet.getString("DATE_OF_RELEASE") %></td>
                        </tr>
                    </tbody>
                </table>
                <% 
                  }
                %>
            </div>
        </div>
    </body>
</html>
