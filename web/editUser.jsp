<%-- 
    Document   : login
    Created on : Dec 2, 2014, 12:18:03 AM
    Author     : Ahmad Tahfiz
--%>
<%@ page import="java.sql.*" %>
<%@page import="db.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="Header.jsp"/>
<% String id = request.getParameter("staffID"); %>

<html>
    <head>
        <title>Edit User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="js/libs/twitter-bootstrap/css/bootstrap.css" type="text/css"/>
    </head>
    <%!
        String name, pwd;
        int level;
    %>
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
            
            String query = "SELECT * FROM users WHERE staffID='" + id + "'";
            PreparedStatement selectUser = connection.prepareStatement(query);
            ResultSet resultset = selectUser.executeQuery();
                        
            if(resultset.next()){
                name =resultset.getString("fullName");
                pwd = resultset.getString("password");
                level = resultset.getInt("userLevel");
            }
        %>
        
    <body>        
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="page-header">
                        <h2>Edit User</h2>
                    </div>
                    
                    <form class="form-horizontal" method="POST" action="./EditUser">
                        
                        <div class="form-group">
                          <div class="col-sm-5">
                            <input type="hidden" name="id" value="<%= id %>">
                          </div>
                        </div>
                          
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Username</label>
                          <div class="col-sm-5">
                            <input type="text" name="username" value="<%= id %>" class="form-control" placeholder="Staff ID">
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Password</label>
                          <div class="col-sm-5">
                              <input type="text" name="password" value="<%= pwd %>" class="form-control" placeholder="Password">
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Name</label>
                          <div class="col-sm-5">
                            <input type="text" name="name" value="<%= name %>" class="form-control" placeholder="Full Name">
                          </div>
                        </div>
                        
                        <div class="form-group">
                            
                            <label class="col-sm-2 control-label">User Level</label>
                            <% if(level == 1){%>
                              <label class="radio-inline">
                                  <input type="radio" name="level" value="1" checked> Admin
                              </label>
                              <label class="radio-inline">
                                  <input type="radio" name="level" value="2"> Staff
                              </label>
                            <% }
                            else{ %>
                              <label class="radio-inline">
                                  <input type="radio" name="level" value="1"> Admin
                              </label>
                              <label class="radio-inline">
                                  <input type="radio" name="level" value="2" checked> Staff
                              </label>
                            <% } %>
                        </div>
                        
                        <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Update</button>
                          </div>
                        </div>
                    </form>
                </div>
            </div>            
        </div>
    </body>
</html>