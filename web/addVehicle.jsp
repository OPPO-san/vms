<jsp:include page="Header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <center><h1>Add New Vehicle</h1></center>
        </div>
        
        <div class="panel-body">
            <form action="./addVehicle" method="post" class="form-group">
                <label>Plate Number: </label><input type="text" name="plateNum"><br>
                <label>Driver: </label><input type="text" name="driver"><br>
                <label>Type</label>
                    <select name="type">
                        <option>Car</option>
                        <option>Motorcycle</option>
                        <option>Lorry</option>
                        <option>Bus</option>
                    </select>
                <dl>
                <dt>Date of Release: 
                      <dd>Year: <input type="number" name="year" min="1980" max="2014"></dd> 
                      <dd>Month: <input type="number" name="month" min="1" max="12"></dd> 
                      <dd>Date: <input type="number" name="date" min="1" max="31"></dd>
                </dl>
                 <label>Model: </label><input type="text" name="model"><br>
                 <label>Mileage: </label><input type="number" name="mileage" min="1"><br>
                 <label>Service Mileage: </label><input type="number" name="service_mileage" min="1"><br>
                 <label>Vehicle Status: </label><textarea rows="5" cols="20" name="status"></textarea><br>
                 <input type="submit" value="Add">
            </form>
        </div>
    <div>
        <br>
        <jsp:include page="Footer.jsp" />
    </div>
    </body>
</html>
