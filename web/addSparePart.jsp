<%-- 
    Document   : addSparePart
    Created on : Dec 14, 2014, 11:12:59 PM
    Author     : Nurizzati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <title>Add Spare Part</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>
            <center><h1>Add New Spare Part</h1></center>
        </div>
        <div><center>
            <form action="./AddPart" method="post">
                <label>Spare Part ID   : </label><input type="text" name="part_id"><br><br>
                <label>Spare Part Name: </label><input type="text" name="part_name"><br><br>
                <label>Quantity          : </label><input type="number" name="quantity" min="1"><br><br>
                <label>Cost(per item)  : </label><input type="text" name="cost"><br><br>              
                 <input type="submit" value="Add">
            </form>
            </center></div>
    </body>
</html>
