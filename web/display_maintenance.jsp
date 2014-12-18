<jsp:include page="Header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maintenance</title>
    </head>
    <body>
        <%@ page import="mypackage.*, java.sql.*" %>
        <%! String sql="SELECT SIRI_NUM, MAINTENANCE.PLATE_NUM, DATE_OF_MAINTENANCE, MAINTENANCE_TYPE, VEHICLE.MILEAGE, VEHICLE.SERVICE_MILEAGE"
                +" FROM MAINTENANCE JOIN VEHICLE ON MAINTENANCE.PLATE_NUM=VEHICLE.PLATE_NUM"; %>
        <center>        
        <table class="table">
            <th>SIRI number</th>
            <th>Plate Number</th>
            <th>Date of Maintenance</th>
            <th>Maintenance Type</th>
            <th>Mileage</th>
            <th>Service Mileage</th>
        <% ResultSet rs = display_vehicle.DBConnection(sql);
           ResultSetMetaData rsMeta = rs.getMetaData();
           int column = rsMeta.getColumnCount();
           while(rs.next()){%>
            <tr>
                <% for(int i=1;i<=column;i++){%>
                <td><%= rs.getString(i)%></td>
                <%}%>
                <td><form>
                    <label>Service Mileage:</label><br>
                    <input type="number" min="1" name="service_mileage"><br>
                    <button type="submit" formaction="./updateMileage?plate_num=<%=rs.getString(2)%>" formmethod="post">Change</button>
                    </form>
               </td>
        <%}%>
        </table>
        </center>
        <div>
            <br>
            <jsp:include page="Footer.jsp" />
        </div>
    </body>
</html>
