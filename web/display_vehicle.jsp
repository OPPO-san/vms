
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="Header.jsp"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Vehicle</title>
    </head>
    <body>
           <div class="container">
           <div class="row">
             <div class="table-responsive"> 
                <div class="panel panel-primary">
                    <div class="panel-heading">Manage Vehicle Data</div>
                        <div class="panel-body">
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
            <th>Action</th>
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
                    <a href="./delete?plate_num=<%=rs.getString(1)%>">
                        <img src="image/delete.ico" alt="HTML tutorial" style="width:42px;height:42px;border:0">
                    </a>
                    <a href="./updateVehicle.jsp?plate_num=<%=rs.getString(1)%>">
                        <img src="image/edit.ico" alt="HTML tutorial" style="width:42px;height:42px;border:0">
                    </a>
                    </form>
               </td>
        <%}%>
        </table>
        </center>
   
                        </div>
                </div>
             </div>
           </div>
        </div>
    </div> 
    <div>
        <br>
        <jsp:include page="Footer.jsp" />
    </div>
    </body>
</html>
