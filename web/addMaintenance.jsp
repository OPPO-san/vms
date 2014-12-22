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
                    
                    String query = "SELECT PART_NAME FROM spare_part";
                    PreparedStatement selectUser = connection.prepareStatement(query);
                    ResultSet resultset = selectUser.executeQuery();
                    
                    String query1 = "SELECT SERVICE_ID FROM service";
                    PreparedStatement selectUser1 = connection.prepareStatement(query1);
                    ResultSet resultset1 = selectUser1.executeQuery();
                    
                    String query2 = "SELECT PLATE_NUM FROM vehicle";
                    PreparedStatement selectUser2 = connection.prepareStatement(query2);
                    ResultSet resultset2 = selectUser2.executeQuery();
                    
        %>
                    
                    
		
    </head>
    <body>
        <div class="container">
           <div class="row">
             <div class="table-responsive"> 
            <div class="panel panel-primary">
                    <div class="panel-heading">Add Maintenance Record</div>
            <div class="panel-body">
            <form action="./addMaintenance" method="post">
                <label>Siri No.   : </label><input type="text" name="siri_no"><br><br>
                <label>Plate No. : </label>
                <select class="form-group" name="plat_no" >
		<option value="f0">---Choose Plate No---</option>
		<% while(resultset2.next()){ %>
                <option value="<%= resultset2.getString("PLATE_NUM") %>"><%= resultset2.getString("PLATE_NUM") %></option>
		<%}%>
		</select>
                <br/>
                <label>Date Of Maintenance : </label><input type="date" name="date"><br><br>
                <label>Type Of Maintenance  : </label><br>
                <div class="radio-inline">
                <div>
                    <input type="radio" name="type" value="Battery Maintenance">Battery Maintenance
                </div>
                <div>
                    <input type="radio" name="type" value="Brake Maintenance">Brake Maintenance
                </div>
                <div>
                    <input type="radio" name="type" value="Tune Up">Tune Up
                </div>
                <div>
                    <input type="radio" name="type" value="Engine Maintenance">Engine Maintenance
                </div>
                <div>
                    <input type="radio" name="type" value="Car Wax">Car Wax
                </div>
                <div>
                    <input type="radio" name="type" value="Tire Maintenance">Tire Maintenance
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
