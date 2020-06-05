<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
        <meta charset="utf-8">
        <title>Log in with your account</title>

        <link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet">
        <link href="<c:url value='/static/css/common.css' />" rel="stylesheet">
        <style>
            #login{
                font-size: 26px;
                font-weight: 700;
            }
            #errormessage{
                color: green;
                font-size: 14px;
            }
            #register a{
                color:#286090;
            }

        </style>
    </head>

    <body>
        <jsp:include page="headerWithShopCart.jsp" />
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <form method="POST" action="login" class="form-signin">
                <h2  id="login" class="form-heading"><i class="fas fa-user" style="font-size: 20px;">&nbsp; </i>Log in</h2>

                <div class="form-group ${error != null ? 'has-error' : ''}">
                    <input name="username" type="text" class="form-control" placeholder="Username"
                           autofocus="true"/>
                    <input name="password" type="password" class="form-control" placeholder="Password"/>
                    <span>${error}</span>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <br>
                    <span id="errormessage">${message}</span>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
                    <br>
                    <h4 id="register" class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
                </div>
            </form>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>