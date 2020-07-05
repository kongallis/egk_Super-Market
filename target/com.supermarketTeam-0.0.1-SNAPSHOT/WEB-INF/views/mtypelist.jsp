<!DOCTYPE html>
<html>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <title>Measurement Type List</title>
        <jsp:include page="headerWithShopCart.jsp" />
        <style>
            .panel-default
            {
                width: 40%;
                margin: auto;
                margin-bottom: 40px;
            }
        </style>
    </head>
    <body>
        <br>
        <br>

        <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Measurement Types List</span></div>
            <table class="table table-hover">
                <thead id="thead">
                    <tr>                           
                        <th>Type</th>
                        <th width="100"></th>
                        <th width="100"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${mTypes}" var="mType">
                        <tr>
                            <td hidden>${mType.id}</td>  
                            <td>${mType.type}</td>
                            <td><a href="<c:url value='/mtype/edit/${mType.id}' />" class="btn btn-warning custom-width">Edit</a></td>
                            <td><a href="<c:url value='/mtype/delete/${mType.id}' />" class="btn btn-danger custom-width">Delete</a></td>
                        </tr>
                    </c:forEach> 
                </tbody>
                <div class="well">
                    <td><a href="<c:url value='/mtype/new' />" class="btn btn-primary custom-width" id="submitbtn" >Add</a></td>
                </div>
            </table>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>