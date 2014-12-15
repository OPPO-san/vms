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
            final String serverName= "localhost";
            final String databaseName= "vms";
            String username = "root"; // Username/password required
            String password = "izzati"; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
            
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            
            String query = "SELECT * FROM spare_part";
            PreparedStatement selectUser = connection.prepareStatement(query);
            ResultSet resultset = selectUser.executeQuery();
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
                      <th>Action</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                    <% while(resultset.next()){ %>
                    <tr>
                      <td><%= resultset.getString("SPAREPART_ID") %></td>
                      <td><%= resultset.getString("PART_NAME") %></td>
                      <td><%= resultset.getString("COST") %></td>
                      <td><%= resultset.getString("QUANTITY") %></td>
                      <td>
                        <a href="addSparePart.jsp">
			<img src="image/add.ico" alt="HTML tutorial" style="width:42px;height:42px;border:0">
			</a>
                          
                        <a href="editSparePart.jsp?id=<%= resultset.getString("SPAREPART_ID") %>">
			<img src="image/edit.ico" alt="HTML tutorial" style="width:42px;height:42px;border:0">
			</a>
                          
                        <a href="deleteSparePart.jsp?id=<%= resultset.getString("SPAREPART_ID") %>">
			<img src="image/delete.ico" alt="HTML tutorial" style="width:42px;height:42px;border:0">
			</a>
                      
                      </td>
                    </tr>
                   <% } %>
                  </tbody>
                </table>
              </div>
           </div>
        </div>
    </body>
    <jsp:include page="Footer.jsp" />
</html>
