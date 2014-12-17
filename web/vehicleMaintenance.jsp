<%-- 
    Document   : vehicleMaintenance
    Created on : Dec 2, 2014, 9:01:11 AM
    Author     : Nurizzati
--%>
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
            String password = ""; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
            
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            
            String query = "SELECT * FROM maintenance";
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
                <a href="addMaintenance.jsp">
	            <img src="image/add.ico" alt="HTML tutorial" style="width:42px;height:42px;border:0">
	        </a> 
                 <div class="panel-body">
                 <table class="table">
                  <thead>
                    <tr>
                      <th>Siri No.</th>
                      <th>Plat No.</th>
                      <th>Date Of Maintenance</th>
                      <th>Type Of Maintenance</th>
                      <th>Millege</th>
                      <th>Service  ID</th>
                      <th>Action</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                    <% while(resultset.next()){ %>
                    <tr>
                      <td><%= resultset.getString("SIRI_NUM") %></td>
                      <td><%= resultset.getString("PLATE_NUM") %></td>
                      <td><%= resultset.getString("DATE_OF_MAINTENANCE") %></td>
                      <td><%= resultset.getString("MAINTENANCE_TYPE") %></td>
                      <td></td>
                      <td><%= resultset.getString("SERVICE_ID") %></td>
                      <td>
                        
                          
                        <a href="editMaintenance.jsp?siri_no=<%= resultset.getString("SIRI_NUM") %>">
			<img src="image/edit.ico" alt="HTML tutorial" style="width:42px;height:42px;border:0">
			</a>
                          
                        <a href="deleteMaintenance.jsp?siri_no=<%= resultset.getString("SIRI_NUM") %>">
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
        </div>
    </body>
    <jsp:include page="Footer.jsp" />
</html>



         
                
     