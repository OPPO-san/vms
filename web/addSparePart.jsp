<%-- 
    Document   : addSparePart
    Created on : Dec 14, 2014, 11:12:59 PM
    Author     : Nurizzati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <jsp:include page="Header.jsp" />
        <title>Add Spare Part</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
           <div class="row">
             <div class="table-responsive"> 
            <div class="panel panel-primary">
                    <div class="panel-heading">Add Spare Part Data</div>
            <div class="panel-body">
            <form action="./AddPart" method="post">
                <label>Spare Part ID   : </label><input type="text" name="part_id"><br><br>
                <label>Spare Part Name: </label><input type="text" name="part_name"><br><br>
                <label>Quantity          : </label><input type="number" name="quantity" min="1"><br><br>
                <label>Cost(per item)  : </label><input type="text" name="cost"><br><br>              
                <input type="submit" value="Add">
            </form>
            </div>
            </div>
           </div>
        </div>
            
    </body>
    <jsp:include page="Footer.jsp" />
</html>
