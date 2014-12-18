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
            String password = ""; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
            
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            
            String query = "SELECT * FROM spare_part WHERE SPAREPART_ID= ?";
            PreparedStatement selectSparePart = connection.prepareStatement(query);
            selectSparePart.setInt(1,id);;
            ResultSet resultset = selectSparePart.executeQuery();
        %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Spare Part</title>
    </head>
    <body>
        <div class="container">
           <div class="row">
             <div class="table-responsive"> 
                 
                 <div class="panel panel-primary">
                    <div class="panel-heading">Edit Spare Part Data</div>
                    <div class="panel-body">
                      <form action="./EditPart" method="post">
                        <% while(resultset.next()){ %>
                            <input type="hidden" value="<%= resultset.getString("SPAREPART_ID") %>"name="id">
                            <label>Spare Part ID   : </label><%= resultset.getString("SPAREPART_ID") %><br><br>
                            <label>Spare Part Name: </label><input type="text" value="<%= resultset.getString("PART_NAME") %>"name="part_name"><br><br>
                            <label>Quantity          : </label><input type="number" value="<%= resultset.getString("QUANTITY") %>" name="quantity" min="1"><br><br>
                            <label>Cost(per item)  : </label><input type="text" value="<%= resultset.getString("COST") %>" name="cost"><br><br>
                            <input type="submit" value="Save">
                        <% } %>
                      </form>
                    </div>
                  </div>
                
              </div>
           </div>
        </div>
    </body>
    <jsp:include page="Footer.jsp" />
</html>
