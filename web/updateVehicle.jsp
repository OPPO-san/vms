<jsp:include page="Header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Vehicle</title>
    </head>
    <body>
        <%@ page import="mypackage.*, java.sql.*"%>
        <% String sql ="SELECT PLATE_NUM, DRIVER, VEHICLE_TYPE.VEC_TYPE, DATE_OF_RELEASE, MODEL, MILEAGE, SERVICE_MILEAGE, VEC_STATUS FROM VEHICLE "
                + "JOIN VEHICLE_TYPE ON VEHICLE.TYPE_ID=VEHICLE_TYPE.TYPE_ID WHERE PLATE_NUM='"+request.getParameter("plate_num")+"'"; %>
        <% ResultSet rs=display_vehicle.DBConnection(sql); 
            rs.next();
        %> 
         <div class="container">
           <div class="row">
             <div class="table-responsive"> 
                <div class="panel panel-primary">
                    <div class="panel-heading">Update Vehicle</div>
                        <div class="panel-body">
                            <form action="./updateVehicle?plate_num=<%=request.getParameter("plate_num")%>" method="post">
                               <p>Plate Number: <%=rs.getString(1)%></p><br>
                               <label>Driver: </label><input type="text" name="driver" value="<%=rs.getString(2)%>"><br>
                               <label>Type</label>
                                   <select name="type">
                                       <% String type=rs.getString(3);
                                       if(type.equals("Car")){%>
                                           <option selected>Car</option>
                                       <%}else{%>
                                           <option>Car</option>

                                       <%} if(type.equals("Motorcycle")){%>
                                           <option selected>Motorcycle</option>
                                       <%} else{%>
                                           <option>Motorcycle</option>

                                       <%} if(type.equals("Lorry")){%>
                                           <option selected>Lorry</option>
                                       <%} else{%>
                                           <option>Lorry</option>

                                       <%} if(type.equals("bus")){%>    
                                           <option selected>Bus</option>
                                       <%} else{%>
                                           <option>Bus</option>
                                       <%}%>
                                   </select><br>                
                                <label>Date of Release:</label><input type="text" name="date" value="<%= rs.getString(4)%>"><br> 
                                <label>Model: </label><input type="text" name="model" value="<%=rs.getString(5)%>"><br>
                                <label>Mileage: </label><input type="number" name="mileage" min="1" value="<%=rs.getString(6)%>"><br>
                                <label>Service Mileage: </label><input type="number" name="service_mileage" min="1" value="<%=rs.getString(7)%>"><br>
                                <label>Vehicle Status: </label><textarea rows="5" cols="20" name="status"><%=rs.getString(8)%></textarea><br>
                                <input type="submit" value="Update">
                           </form>
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
