<jsp:include page="Header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service</title>
    </head>
    <body>
        <%@ page import="mypackage.*, java.sql.*" %>
        <%! String sql="SELECT * FROM SERVICE "; %>
        <div class="container">
            <div class="row">
                <div class="table-responsive"> 
                  <div class="panel panel-primary">
                    <div class="panel-heading">Service</div>
                    <div class="panel-body">
                        
                    <table class="table">
                        <th>Service ID</th>
                        <th>Siri Number</th>
                        <th>Service Cost</th>
                        <th>Payment Status</th>
                        <% ResultSet rs = display_vehicle.DBConnection(sql);
                       ResultSetMetaData rsMeta = rs.getMetaData();
                       int column = rsMeta.getColumnCount();
                       while(rs.next()){%>
                        <tr>
                            <% for(int i=1;i<=column;i++){%>
                            <td><%= rs.getString(i)%></td>
                            <%}
                       }%>
                       </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
            <br>
         </body>
    <jsp:include page="Footer.jsp" />
</html>
