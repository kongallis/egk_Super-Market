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
        <title>Product List</title>
    </head>
    <body>
        <jsp:include page="headerWithShopCart.jsp" />
        <br>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Product's List</span></div>
            <table class="table table-hover">
                <thead id="thead">
                    <tr>                       
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Bio</th>
                        <th>Category</th>
                        <th>Measurement</th>
                        <th>Image</th>
                        <th width="100"></th>
                        <th width="100"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td hidden>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.brand}</td>
                            <td>${product.quantity}</td>
                            <td>${product.price}</td>
                            <td>${product.bio}</td>
                            <td>${product.categoryId.categoryName}</td>
                            <td>${product.measurementId.type}</td>
                            <td><img src="<c:url value="/static/img/${product.image}" />" width="40px" height="40px"></td>
                            <td><a href="<c:url value='/product/edit/${product.id}' />" class="btn btn-warning custom-width">Edit</a></td>
                            <td><a href="<c:url value='/product/delete/${product.id}' />" class="btn btn-danger custom-width">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <div class="well">
                    <td><a href="<c:url value='/product/new' />" class="btn btn-primary custom-width" id="submitbtn" >Add</a></td>
                </div>
            </table>
        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>