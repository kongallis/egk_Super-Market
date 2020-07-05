<!DOCTYPE html>
<html>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <title>Address List</title>

    </head>
    <body>
        <jsp:include page="headerWithShopCart.jsp" />
        <br>
        <br>

        <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Addresses's List</span></div>
            <table class="table table-hover">
                <thead id="thead">
                    <tr>                       
                        <th>Address</th>
                        <th>City</th>
                        <th>Country</th>
                        <th>PostCode</th>
                        <th>Telephone</th>
                        <th>Text</th>
                        <th>User</th>
                        <th width="100"></th>
                        <th width="100"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${addresses}" var="address">
                        <tr>
                            <td hidden>${address.id}</td>
                            <td>${address.addressName}</td>
                            <td>${address.city}</td>
                            <td>${address.country}</td>
                            <td>${address.postcode}</td>
                            <td>${address.telephone}</td>
                            <td>${address.text}</td>
                            <td>${address.userId.username}</td>
                            <td><a href="<c:url value='/address/edit/${address.id}' />" class="btn btn-warning custom-width">Edit</a></td>
                            <td><a href="<c:url value='/address/delete/${address.id}' />" class="btn btn-danger custom-width">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <div class="well">
                    <td><a href="<c:url value='/address/new' />" class="btn btn-primary custom-width" id="submitbtn" >Add</a></td>
                </div>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>