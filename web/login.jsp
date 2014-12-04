<%-- 
    Document   : login
    Created on : Dec 2, 2014, 12:18:03 AM
    Author     : Ahmad Tahfiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Sign In</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="js/libs/twitter-bootstrap/css/bootstrap.css" type="text/css"/>
    </head>
        
    <body>        
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="page-header">
                        <h2>Sign In</h2>
                    </div>
                    
                    <form class="form-horizontal" method="POST" action="./LoginVerify">
                        
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Username</label>
                          <div class="col-sm-5">
                            <input type="text" name="username" class="form-control" placeholder="Username">
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Password</label>
                          <div class="col-sm-5">
                            <input type="password" name="password" class="form-control" placeholder="Password">
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Sign in</button>
                          </div>
                        </div>
                    </form>
                </div>
            </div>            
        </div>
    </body>
</html>