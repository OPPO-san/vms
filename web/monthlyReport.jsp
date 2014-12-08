<%-- 
    Document   : monthlyReport
    Created on : Dec 2, 2014, 9:02:44 AM
    Author     : Nurizzati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Header.jsp" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
           <div class="row">
             <div class="table-responsive"> 
                <table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th>Siri No.</th>
                      <th>Plate Number</th>
                      <th>Maintenance Date</th>
                      <th>Maintenance Type</th>
                      <th>Service ID</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Anna Awesome</td>
                      <td>Broome Street</td>
                      <td>Broome Street</td>
                      <td>Broome Street</td>
                    </tr>
                   
                  </tbody>
                </table>
              </div>
           </div>
        </div>
    </body>
    <jsp:include page="Footer.jsp" />
</html>