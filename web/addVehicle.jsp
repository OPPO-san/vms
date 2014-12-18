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
       <div class="container">
           <div class="row">
             <div class="table-responsive"> 
                <div class="panel panel-primary">
                    <div class="panel-heading">Add New Vehicle</div>
                        <div class="panel-body">
                            <form action="./addVehicle?service_mileage=0" method="post" class="form-group">
                                <label>Plate Number: </label><input type="text" name="plateNum"><br>
                                <label>Driver: </label><input type="text" name="driver"><br>
                                <label>Type</label>
                                    <select name="type">
                                        <option>Car</option>
                                        <option>Motorcycle</option>
                                        <option>Lorry</option>
                                        <option>Bus</option>
                                    </select><br>
                                <label>Date of Release:</label><input type='date' name='date'><br>
                                 <label>Model: </label><input type="text" name="model"><br>
                                 <label>Mileage: </label><input type="number" name="mileage" min="1"><br>                 
                                 <label>Vehicle Status: </label><textarea rows="5" cols="20" name="status"></textarea><br>
                                 <input type="submit" value="Add">
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
