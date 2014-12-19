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
    <% String year = request.getParameter("year");  %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monthly Report</title>
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
            
            String query = "SELECT * FROM maintenance,vehicle WHERE YEAR(DATE_OF_MAINTENANCE) = ?"
                            + "AND maintenance.PLATE_NUM=vehicle.PLATE_NUM";
            PreparedStatement selectInfo = connection.prepareStatement(query);
            selectInfo.setString(1,year);
            ResultSet resultMain = selectInfo.executeQuery();
        %>
        <div class="container">
            <div class="row">
                <% while(resultMain.next()){
                    
                    String query2 = "SELECT * FROM service WHERE SIRI_NUM= ?";
                    PreparedStatement selectCost = connection.prepareStatement(query2);
                    selectCost.setString(1,resultMain.getString("SIRI_NUM"));
                    ResultSet resultset = selectCost.executeQuery();
                    
                    while(resultset.next()){
                        
                        int i = 1;
                        out.println("DRIVER:"+resultMain.getString("DRIVER")+" ("+ resultMain.getString("PLATE_NUM") +")");
                %>
                <table class="table table-bordered">
                    <thead>
                    <th>No<th>DATE<th>Current Mileage<th>Service Mileage<th>Description<th>Service ID<th>EXPENSES</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%= i++ %></td>
                            <td><%= resultMain.getString("DATE_OF_MAINTENANCE") %></td>
                            <td><%= resultMain.getString("MILEAGE") %></td>
                            <td><%= resultMain.getString("SERVICE_MILEAGE") %></td>
                            <td><%= resultMain.getString("MAINTENANCE_TYPE") %></td>
                            <td><%= resultset.getString("SERVICE_ID") %></td>
                            <td><%= resultset.getString("SERVICE_COST") %></td>
                        </tr>
                    </tbody>
                </table>
                <% 
                    }
                  }
                %>
            </div>
        </div>
    </body>
</html>
