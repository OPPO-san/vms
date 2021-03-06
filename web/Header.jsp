<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html><head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="js/libs/twitter-bootstrap/css/bootstrap.css" type="text/css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <div class="container">
    <div class="row">
    <jsp:useBean id="user" class="mypackage.User" scope="session"/>
    
    <div>
        <img src="image/cover.png" >
        <ul class="nav nav-tabs">
        <% if(user.getLevel() == 1){ %>
           <li><a href="admin.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
           <li><a href="signup.jsp"><span class="glyphicon glyphicon-floppy-disk"></span> Register User </a></li>
        <% } 
        else{
        %>
            <li><a href="home.jsp"><span class="glyphicon glyphicon-home"></span>  Home</a></li>
            <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle"><span class="glyphicon glyphicon-plane"></span> Vehicle<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="addVehicle.jsp">Add New Vehicle</a></li>
                    <li><a href="display_vehicle.jsp">Manage Vehicle Data</a></li>
                    <li><a href="vehicleMaintenance.jsp">Manage Vehicle Maintenance</a></li>
                    <li><a href="viewSparePart.jsp">Manage Spare Part</a></li>
                    <li><a href="display_service.jsp">View Service & Payment</a></li>
                </ul>
            </li>
            <li><a href="display_maintenance.jsp"><span class="glyphicon glyphicon-list-alt"></span> Schedule</a></li>
             <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle"><span class="glyphicon glyphicon-plane"></span> Report<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="monthlyReport.jsp">Monthly Report</a></li>
                    <li><a href="yearlyReport.jsp">Yearly Report</a></li>
                    <li><a href="./VehicleReport">Vehicle Report</a></li>
                </ul>
            </li>
        <% } %>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="./Logout"><span class="glyphicon glyphicon-log-out"></span>Log Out</a></li>
        </ul>
        </ul></br>
    </div>
    </div>
    </div>
