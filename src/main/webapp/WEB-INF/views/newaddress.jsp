<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
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
        <title>Add Address</title>
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
            #errorpc{
                color: red;
                font-size: 12px;
            }
            #errortel{
                color: red;
                font-size: 12px; 
            }
        </style>
    </head>
    <body>
        <br>
        <br>
        <div class="generic-container">
            <h2>Register a new Address</h2>
            <br>
            <form:form  id="form" method="POST" action="new" modelAttribute="address" class="form-horizontal">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="addressName">Address</label>
                        <div class="col-md-7">
                            <form:input type="text" path="addressName" class="form-control input-sm" maxlength="40" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="city">City</label>
                        <div class="col-md-7">
                            <form:input type="text" path="city" class="form-control input-sm" maxlength="30" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="country">Country</label>
                        <div class="col-md-7">
                            <form:input type="text" path="country" class="form-control input-sm" maxlength="30" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="postcode">Post Code</label>
                        <div class="col-md-7">
                            <form:input type="text" path="postcode" class="form-control input-sm" maxlength="12" required="required"/>
                            <div id="errorpc"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="telephone">Telephone</label>
                        <div class="col-md-7">
                            <form:input type="text" path="telephone" class="form-control input-sm" maxlength="12" required="required"/>
                            <div id="errortel"></div>
                        </div>
                    </div>
                </div>    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="text">Instructions</label>
                        <div class="col-md-7">
                            <form:input type="text" path="text" class="form-control input-sm" maxlength="255" required="required"/>
                        </div>
                    </div>
                </div>        
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="userId.id">User ID</label>
                        <div class="col-md-7">
                            <form:input type="text" path="userId.id" value="${userId}" class="form-control input-sm" maxlength="45"/>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script>
            const postal = document.getElementById("postcode");
            const tel = document.getElementById("telephone");
            const form = document.getElementById("form");
            const errorElementpc = document.getElementById("errorpc");
            const errorElementtel = document.getElementById("errortel");

            form.addEventListener("submit", (e) => {
                let messagespc = [];
                let messagestel = [];
                var numbers = /^[0-9]+$/;
                if (!postal.value.match(numbers)) {
                    e.preventDefault();
                    messagespc.push("Invalid input for Postal Code")
                    errorElementpc.innerText = messagespc;
                }
                if (!tel.value.match(numbers)) {
                    e.preventDefault();
                    messagestel.push("Invalid input for Telephone")
                    errorElementtel.innerText = messagestel;
                }
            });
        </script>
    </body>
</html>