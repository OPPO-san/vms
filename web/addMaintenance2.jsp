<%-- 
    Document   : addMaintenance
    Created on : Dec 16, 2014, 6:15:35 PM
    Author     : Nurizzati
--%>

<%@ page import="java.sql.*" %>
<%@page import="db.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
   <head>
       <jsp:include page="Header.jsp" />
        <title>Add Maintenance Record</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    
                    String query = "SELECT * FROM spare_part";
                    PreparedStatement selectUser = connection.prepareStatement(query);
                    ResultSet resultset = selectUser.executeQuery();   
                    
        %>
    </head>
    <body>
        <div class="container">
           <div class="row">
             <div class="table-responsive"> 
            <div class="panel panel-primary">
                    <div class="panel-heading">Add Maintenance Record</div>
            <div class="panel-body">
                <form action="./calculateTotal?siri_num=<%= request.getParameter("siri_no") %>" method="post">
                <label>List Of Spare Part  : </label><br>
                <div class="radio-inline">
               
                <% while(resultset.next()){ %>  
                <input type="checkbox" name="sparePart" value="<%= resultset.getString("SPAREPART_ID") %>"/><%= resultset.getString("PART_NAME") %><br>
                <% } %>
                </div>
                <br><br> 
                <input type="submit" Value="Calculate Total">
                <br><br> 
            </form>
            </div>
            </div>
           </div>
        </div>  
        </div>  
</body>
    <jsp:include page="Footer.jsp" />
</html>
