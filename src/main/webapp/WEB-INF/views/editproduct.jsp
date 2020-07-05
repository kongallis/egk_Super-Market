<!DOCTYPE html>
<html>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <head>
        <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <title>Update Product</title>
        <jsp:include page="headerWithShopCart.jsp" />
        <style>
            h2{
                font-size: 16px;
                margin : auto;
                font-weight:700;
            }
            .generic-container
            {
                width: 60%;
                margin-left: 280px;
                font-size: 14px !important; 
            }
            #errorquan{
                color: red;
                font-size: 12px;
            }
            #errorprice{
                color: red;
                font-size: 12px; 
            }
        </style>
    </head>
    <body>
        <br>
        <br>        
        <div class="generic-container">
            <h2>Update Product</h2>
            <br>
            <form:form  id="form" method="POST" action="${id}" modelAttribute="product" class="form-horizontal">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="name">Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="name" class="form-control input-sm" maxlength="30" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="brand">Brand</label>
                        <div class="col-md-7">
                            <form:input type="text" path="brand" class="form-control input-sm" maxlength="30" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="quantity">Quantity</label>
                        <div class="col-md-7">
                            <form:input type="text" path="quantity" class="form-control input-sm" maxlength="15" required="required"/>
                            <div id="errorquan"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="price">Price</label>
                        <div class="col-md-7">
                            <form:input type="text" path="price" class="form-control input-sm" maxlength="10" required="required"/>
                            <div id="errorprice"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="bio">Bio</label>
                        <div class="col-md-7">
                            <form:radiobutton path="bio" value="True"/>True  <spring:message code="label.roundYes"/>
                            <form:radiobutton path="bio" value="False"/> False  <spring:message code="label.roundNo"/>
                        </div>
                    </div>
                </div>    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="categoryId.id">Category Type</label>
                        <div class="col-md-7">
                            <form:select path="categoryId.id">
                                <c:forEach items="${categoryList}"  var="category">
                                    <option value="${category.id}">${category.categoryName}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                </div>        
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="measurementId.id">Measure Type</label>
                        <div class="col-md-7">
                            <form:select path="measurementId.id">
                                <c:forEach items="${mTypeList}"  var="mType">
                                    <option value="${mType.id}">${mType.type}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="image">Image</label>
                        <div class="col-md-7">
                            <form:input type="file" path="image" accept="image/x-png,image/gif,image/jpeg" class="form-control input-sm" maxlength="45" required="required"/>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script>
            const quantity = document.getElementById("quantity");
            const price = document.getElementById("price");
            const form = document.getElementById("form");
            const errorElementQuan = document.getElementById("errorquan");
            const errorElementPrice = document.getElementById("errorprice");

            form.addEventListener("submit", (e) => {
                let messagesQuan = [];
                let messagesPrice = [];
                var numbers = /^[0-9]+$/;
                if (!quantity.value.match(numbers)) {
                    e.preventDefault();
                    messagesQuan.push("Invalid input for Quantity")
                    errorElementQuan.innerText = messagesQuan;
                }
                if (quantity.value < 1) {
                    e.preventDefault();
                    messagesQuan.push("Quantity cannot be 0!")
                    errorElementQuan.innerText = messagesQuan;
                }
                if (!price.value.match(numbers)) {
                    e.preventDefault();
                    messagesPrice.push("Invalid input for Price")
                    errorElementPrice.innerText = messagesPrice;
                }
                if (price.value === 0) {
                    e.preventDefault();
                    messagesPrice.push("Price cannot be 0!")
                    errorElementPrice.innerText = messagesPrice;
                }

            });
        </script>
    </body>
</html>