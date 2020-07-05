<!DOCTYPE html>
<html>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <head>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="<c:url value='/static/css/error.css' />" rel="stylesheet">
        <title></title>
    </head>
    <body>
        <div class="page-wrap d-flex flex-row align-items-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 text-center">
                        <span> <i class="fas fa-check" style="font-size: 100px; color: green;"></i></span>
                        <span class="display-1 d-block">Thank You!</span>
                        <div class="mb-4 lead">Payment was successful!</div>
                        <a href="/ProductBoot/" class="btn btn-link">Back to Home</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <jsp:include page="footer.jsp" />
        <script>
            console.log(sessionStorage.getItem("paypalamount"), typeof sessionStorage.getItem("paypalamount"));
        </script>
        <script>
            function postPaypalAmount() {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8084/ProductBoot/orderrest", true);

                xhr.onload = function () {
                    if (this.status == 200) {
                        var graphData = JSON.parse(xhr.responseText);
                        console.log(graphData, "SUCCESS");
                    }
                };
                var item = Number(sessionStorage.getItem("paypalamount"));
                console.log(item);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.send(JSON.stringify({"totalAmount": item, "date": "2020-08-01"}));
            }
            $(document).ready(function () {
                postPaypalAmount();
            });
        </script>
    </body>
</html>