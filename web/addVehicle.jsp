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
                            <form action="./addVehicle" method="post" class="form-group">
                                
                          <div class="form-group">
                              <label class="col-sm-2 control-label">Plate Number :</label>
                          <div class="col-sm-5">
                            <input type="text" name="plateNum" class="form-control" placeholder="Plate Number">
                          </div>
                          </div><br><br>
                                
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Driver :</label>
                          <div class="col-sm-5">
                            <input type="text" name="driver" class="form-control" placeholder="Driver Name">
                          </div>
                            </div><br><br>
                                
                             <div class="form-group">
                                <label class="col-sm-2 control-label">Type :</label>
                          <div class="col-sm-5">
                           <select name="type">
                                        <option>Car</option>
                                        <option>Motorcycle</option>
                                        <option>Lorry</option>
                                        <option>Bus</option>
                                    </select><br>
                          </div>
                            </div><br>   
          
                                    
                                    
                                    <div class="form-group">
                          <label class="col-sm-2 control-label">Date of Release :</label>
                          <div class="col-sm-5">
                            <input type='date' name='date' class="form-control" placeholder="Date">
                          </div>
                          </div><br><br>
                            
                                
                                
                                
                          <div class="form-group">
                          <label class="col-sm-2 control-label">Model :</label>
                          <div class="col-sm-5">
                            <input type="text" name="model" class="form-control" placeholder="Model">
                          </div>
                          </div><br><br>
                                
                                 
                          <div class="form-group">
                              <label class="col-sm-2 control-label">Mileage :</label>
                          <div class="col-sm-5">
                            <input type="number" name="mileage" min="1" class="form-control" placeholder="Mileage">
                          </div>
                          </div><br><br> 
                          
                               
                                
                                
                          <div class="form-group">
                              <label class="col-sm-2 control-label">Vehicle Status :</label>
                              <div class="col-sm-5"><textarea rows="7" cols="40" name="status"></textarea></div>
                          </div><br>
                           <br><br>
                               
                              
                                <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Add</button>
                          </div>
                        </div>
                          <br><br>
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
