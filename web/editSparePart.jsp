<%-- 
    Document   : sparePart
    Created on : Dec 2, 2014, 9:02:21 AM
    Author     : Nurizzati
--%>
<%@ page import="java.sql.*" %>
<%@page import="db.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Header.jsp" />
         <%
            int id = Integer.parseInt(request.getParameter("id"));
            final String serverName= "localhost";
            final String databaseName= "vms";
            String username = "root"; // Username/password required
            String password = "izzati"; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
            
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement selectUser = connection.createStatement();
            ResultSet resultset = selectUser.executeQuery("SELECT * FROM spare_part WHERE SPAREPART_ID='124'");
            
        %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Spare Part</title>
    </head>
    <body>
        <div class="container">
           <div class="row">
             <div class="table-responsive"> 
                <table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th>Spare Part ID</th>
                      <th>Spare Part Name</th>
                      <th>Quantity</th>
                      <th>Cost(per item)</th>
                      
                      
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><%= resultset.getString(1) %></td>
                      <td><%= resultset.getString(2) %></td>
                      <td><%= resultset.getString(3) %></td>
                      <td><%= resultset.getString(4) %></td>
                    </tr>
                  </tbody>
                </table>
              </div>
           </div>
        </div>
    </body>
    <jsp:include page="Footer.jsp" />
</html>
