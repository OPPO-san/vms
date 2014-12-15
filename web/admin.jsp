<%-- 
    Document   : admin
    Created on : Dec 9, 2014, 9:59:18 AM
    Author     : Ahmad Tahfiz
--%>
<%@ page import="java.sql.*" %>
<%@page import="db.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="Header.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
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
            
            String query = "SELECT * FROM users";
            PreparedStatement selectUser = connection.prepareStatement(query);
            ResultSet resultset = selectUser.executeQuery();
        %>
        
        <div class="container">
            <div class="row">
              <table class="table table-hover">
                <thead>
                <th>STAFF ID<th>NAME<th>PASSWORD<th>USER LEVEL<th>ACTION</th>
                </thead>
                <tbody>
                    
                    <% while(resultset.next()){ %>
                    <tr class="record">
                        <td><%= resultset.getString("staffID") %></td>
                        <td><%= resultset.getString("fullName") %></td>
                        <td><%= resultset.getString("password") %></td>
                        <% if(resultset.getString("userLevel").equals("1"))
                            out.println("<td> Admin </td>"); 
                           else
                            out.println("<td> Staff </td>");
                        %>
                        <td><a href="editUser.jsp?staffID=<%= resultset.getString("staffID") %>"> Edit </a> | <a href="#" id="<%= resultset.getString("staffID") %>" class="delbutton" title="Click To Delete"> Delete </a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>  
            </div>
        </div>
    </body>
</html>
<script type="text/javascript">
$(function() {
	$(".delbutton").click(function(){
	
	//Save the link in a variable called element
	var element = $(this);
	
	//Find the id of the link that was clicked
	var del_id = element.attr("id");
	
	//Built a url to send
	var info = 'id=' + del_id;
	 if(confirm("Sure you want to delete this update? There is NO undo!"))
			  {
	
	 $.ajax({
	   type: "GET",
	   url: "./DeleteUser",
	   data: info,
	   success: function(){ 
	   }
	 });
			 $(this).parents(".record").animate({ backgroundColor: "#fbc7c7" }, "fast")
			.animate({ opacity: "hide" }, "slow");
	 }
	return false;
	});
});
</script>
