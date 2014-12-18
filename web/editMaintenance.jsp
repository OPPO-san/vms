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
                    int id = Integer.parseInt(request.getParameter("siri_no"));
                    final String serverName= "localhost";
                    final String databaseName= "vms";
                    String username = "root"; // Username/password required
                    String password = ""; // for MYSQL SERVER.
                    DriverUtilities.loadDrivers();   
                    String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
                    String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
                    
                    Class.forName(driver);
                    Connection connection = DriverManager.getConnection(url, username, password);
                    
                    String query = "SELECT PART_NAME FROM spare_part";
                    PreparedStatement selectUser = connection.prepareStatement(query);
                    ResultSet resultset = selectUser.executeQuery();
                   
                    String query2 = "SELECT PLATE_NUM FROM vehicle";
                    PreparedStatement selectUser2 = connection.prepareStatement(query2);
                    ResultSet resultset2 = selectUser2.executeQuery();
                    
                    String query3 = "SELECT * FROM maintenance WHERE SIRI_NUM=?";
                    PreparedStatement selectUser3 = connection.prepareStatement(query3);
                    ResultSet resultset3 = selectUser3.executeQuery();
                    
        %>
                    
                    
		
    </head>
    <body>
        <div class="container">
           <div class="row">
             <div class="table-responsive"> 
            <div class="panel panel-primary">
                    <div class="panel-heading">Add Maintenance Record</div>
            <div class="panel-body">
            <form action="./editMaintenance" method="post">
                <label>Siri No.   : </label><input type="text" name="siri_no" value="<%= resultset3.getString("SIRI_NUM") %>"><br><br>
                <label>Plate No. : </label>
                <select class="form-group" name="plat_no" value="<%= resultset3.getString("PLATE_NUM") %>">
		<option value="f0">---Choose Plate No---</option>
		<% while(resultset2.next()){ %>
                <option value="<%= resultset2.getString("PLATE_NUM") %>"><%= resultset2.getString("PLATE_NUM") %></option>
		<%}%>
		</select>
                <br/>
                <label>Date Of Maintenance : </label><input type="date" name="date" value="<%= resultset3.getString("DATE_OF_MAINTENANCE") %>"><br><br>
                <label>Type Of Maintenance  : </label><br>
                <div class="radio-inline">
                <div>
                    <input type="radio" name="type" value="battery">Battery Maintenance
                </div>
                <div>
                    <input type="radio" name="type" value="brake">Brake Maintenance
                </div>
                <div>
                    <input type="radio" name="type" value="tuneUp">Tune Up
                </div>
                <div>
                    <input type="radio" name="type" value="engine">Engine Maintenance
                </div>
                <div>
                    <input type="radio" name="type" value="carWax">Car Wax
                </div>
                <div>
                    <input type="radio" name="type" value="tire">Tire Maintenance
                </div>
                </div>
                <br><br>
                
                <input type="submit" name="Add">
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
