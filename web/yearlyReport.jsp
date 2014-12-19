<%-- 
    Document   : yearlyReport
    Created on : Dec 2, 2014, 9:03:06 AM
    Author     : Nurizzati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Header.jsp" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yearly Report</title>
    </head>
    <body>
        <div class="container">
           <div class="row">
                <div class="page-header">
                        <h2>Yearly Maintenance Report</h2>
                </div>
               
               <form class="form-horizontal" method="GET" action="./reportYearly">
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Year</label>
                          <div class="col-sm-5">
                            <input type="text" name="year" class="form-control" placeholder="Enter Year">
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Detail Report</button>
                          </div>
                          </div>
                        </div>
                    </form>
           </div>
        </div>
    </body>
    <jsp:include page="Footer.jsp" />
</html>
