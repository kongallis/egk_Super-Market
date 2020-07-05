<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <link rel="icon" type="image/png" href="<c:url value='/static/img/favicon-16x16.png' />"   >  
      <meta charset="utf-8">
      <title>Create an account</title>
      <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
      <link href="static/css/bootstrap.min.css" rel="stylesheet">
      <link href="static/css/common.css" rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <style>
           .container{
               font-size: 14px;
               font-weight: 500;
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
        <form:form method="POST" modelAttribute="userForm" class="form-signin">
            <h2 id="account" class="form-signin-heading">Create your account</h2>
              <spring:bind path="firstName">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="firstName" class="form-control" placeholder="First Name"
                                autofocus="true"></form:input>
                    <form:errors path="firstName"></form:errors>
                </div>
            </spring:bind>
            
             <spring:bind path="lastName">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="lastName" class="form-control" placeholder="Last Name"
                                autofocus="true"></form:input>
                    <form:errors path="lastName"></form:errors>
                </div>
            </spring:bind>
            
             <spring:bind path="email">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="email" class="form-control" placeholder="Email"
                                autofocus="true"></form:input>
                    <form:errors path="email"></form:errors>
                </div>
            </spring:bind>
            
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="username" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                    <form:errors path="password"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="passwordConfirm" class="form-control"
                                placeholder="Confirm your password"></form:input>
                    <form:errors path="passwordConfirm"></form:errors>
                </div>
            </spring:bind>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        </form:form>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
  </body>
</html>