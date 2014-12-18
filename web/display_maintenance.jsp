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
        <%! String sql="SELECT MAINTENANCE.SIRI_NUM, MAINTENANCE.PLATE_NUM, DATE_OF_MAINTENANCE, MAINTENANCE_TYPE, VEHICLE.MILEAGE, VEHICLE.SERVICE_MILEAGE, SERVICE.SERVICE_COST, SERVICE.PAYMENT"
                +" FROM MAINTENANCE JOIN VEHICLE ON MAINTENANCE.PLATE_NUM=VEHICLE.PLATE_NUM "
                + "JOIN SERVICE ON MAINTENANCE.SIRI_NUM=SERVICE.SIRI_NUM"; %>
        <div class="container">
            <div class="row">
                <div class="panel-body">        
                    <table class="table">
                        <th>SIRI number</th>
                        <th>Plate Number</th>
                        <th>Date of Maintenance</th>
                        <th>Maintenance Type</th>
                        <th>Mileage</th>
                        <th>Service Mileage</th>
                        <th>Cost(RM)</th>
                        <th>Payment Status</th>
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
                                <button type="submit" formaction="./updateMileage?plate_num=<%=rs.getString(2)%>&old_service_mileage=<%=rs.getString(6)%>" formmethod="post">Update</button>
                                </form>
                           </td>
                           <td>
                                <form>
                                    <button type="submit" formaction="./updatePayment?siri_num=<%=rs.getString(1)%>" formmethod="post">Paid</button>
                                </form>
                           </td>
                               
                    <%}%>
                    </table>
                </div>
            </div>
        </div>
        <div>
            <br>
            <jsp:include page="Footer.jsp" />
        </div>
    </body>
</html>
