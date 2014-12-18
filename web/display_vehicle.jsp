<jsp:include page="Header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Vehicle</title>
    </head>
    <body>
        <%! String sql="SELECT PLATE_NUM, DRIVER, VEHICLE_TYPE.VEC_TYPE, DATE_OF_RELEASE, MODEL, MILEAGE, SERVICE_MILEAGE, VEC_STATUS"
                +" FROM VEHICLE JOIN VEHICLE_TYPE ON VEHICLE.TYPE_ID=VEHICLE_TYPE.TYPE_ID"; %>
        
        <%@ page import="mypackage.*, java.sql.*" %>
        <center>
        <table class="table">
        <tr>
            <th>Plate Number</th>
            <th>Driver</th>
            <th>Vehicle Type</th>
            <th>Date of Release</th>
            <th>Model</th>
            <th>Mileage</th>
            <th>Service Mileage</th>
            <th>Status</th>
        </tr>
        <% ResultSet rs = display_vehicle.DBConnection(sql);
           ResultSetMetaData rsMeta = rs.getMetaData();
           int column = rsMeta.getColumnCount();
        while(rs.next()){%>
        <tr>
                <% for(int i=1;i<=column;i++){%>
                <td><%= rs.getString(i)%></td>
                <%}%>
                <td><form>
                    <button type="submit" formaction="./delete?plate_num=<%=rs.getString(1)%>" formmethod="post">Delete</button>
                    <button type="submit" formaction="./updateVehicle.jsp?plate_num=<%=rs.getString(1)%>" formmethod="post">Change</button>
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
