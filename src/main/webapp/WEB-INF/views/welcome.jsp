<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
        <meta charset="utf-8">
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <title>Welcome!</title>
        <style>
            .d-block {
                width: 100%;
            }
            .carousel-inner {
                width: 100%;
                max-height: 400px !important;
                margin : auto;
            }
            .jumbotron {
                background-image: url("http://localhost:8084/ProductBoot/static/img/manabiko.jpg");
                background-size: cover;
                color: aliceblue;
                height: 400px;
            }
            .jumbotron .quote{
                font-style: italic;
                font-size: 25px;
                margin-top:18%; 
                left:10px;
                color:#fff;
                font-weight: bold;
            }
            .jumbotron .who{
                font-style: italic;
                font-size: 20px;  
            }
            body{
                background-color: #fff ;
            } 
        </style>
    </head>
    <body>
        <jsp:include page="headerWithShopCart.jsp" />

        <div></div>
        <div class="carousel slide" id="mycarousel" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#mycarousel" data-slide-to="0" class="active"> </li>
                <li data-target="#mycarousel" data-slide-to="1"> </li>
                <li data-target="#mycarousel" data-slide-to="2"> </li>
                <li data-target="#mycarousel" data-slide-to="3"> </li>
            </ol>

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<c:url value='/static/img/supermarket.png'/>" class="d-block w-100" alt="image1">
                </div>
                <div class="carousel-item ">
                    <img src="<c:url value='/static/img/customer.jpg'/>" class="d-block w-100" alt="image1">
                </div>
                <div class="carousel-item ">
                    <img src="<c:url value='/static/img/ntomates.jpg'/>" class="d-block w-100" alt="image1">
                </div>
                <div class="carousel-item ">
                    <img src="<c:url value='/static/img/corona.jpeg'/>" class="d-block w-100" alt="image1">
                </div>
            </div>
            <a class="carousel-control-prev" href="#mycarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#mycarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br>
        <br>
        <br>
        <br>
        <div class="jumbotron">
            <p class="quote">
                A person buying ordinary products in a supermarket is in touch with his deepest emotions.<br>
            </p>
            <p class="who"><strong>John Kenneth Galbraith</strong></p>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <jsp:include page="footer.jsp" />
    </body>
</html>