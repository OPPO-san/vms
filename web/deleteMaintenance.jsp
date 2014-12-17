<%-- 
    Document   : sparePart
    Created on : Dec 2, 2014, 9:02:21 AM
    Author     : Nurizzati
--%>
<%@ page import="java.sql.*" %>
<%@page import="db.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

         <%
            int id = Integer.parseInt(request.getParameter("siri_no"));
            final String serverName= "localhost";
            final String databaseName= "vms";
            String username = "root"; // Username/password required
            String password = "izzati"; // for MYSQL SERVER.
            DriverUtilities.loadDrivers();   
            String driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
            String url = DriverUtilities.makeURL(serverName,databaseName,DriverUtilities.MYSQL);
            
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            
            String query = "DELETE FROM maintenance WHERE SIRI_NUM= ?";
            PreparedStatement selectUser = connection.prepareStatement(query);
            selectUser.setInt(1,id);
            selectUser.executeUpdate();
            response.sendRedirect("vehicleMaintenance.jsp");
        %>
