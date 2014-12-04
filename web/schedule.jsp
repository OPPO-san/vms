<%-- 
    Document   : schedule
    Created on : Dec 2, 2014, 12:03:43 AM
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
                    <tr>
                      <td>2</td>
                      <td>Debbie Dallas</td>
                      <td>Houston Street</td>
                      <td>Broome Street</td>
                      <td>Broome Street</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>John Doe</td>
                      <td>Madison Street</td>
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
