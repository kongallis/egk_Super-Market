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
        <title>Category List</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed"
                            data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                            aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<c:url value='/' />">Registration and
                        Login Module</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li sec:authorize="isAuthenticated()"><a href="<c:url value="/logout" />">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <br>
        <div class="generic-container">
            <div class="panel panel-default">
                <div class="panel-heading"><span class="lead">Category's List</span></div>
                <table class="table table-hover">
                    <thead id="thead">
                        <tr>
                            <th>ID</th>
                            <th>Category</th>
                            <th width="100"></th>
                            <th width="100"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${categories}" var="category">
                            <tr>
                                <td>${category.id}</td>
                                <td>${category.categoryName}</td>
                                <td><a href="<c:url value='/category/edit/${category.id}' />" class="btn btn-warning custom-width">Edit</a></td>
                                <td><a href="<c:url value='/category/delete/${category.id}' />" class="btn btn-danger custom-width">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <div class="well">
                        <td><a href="<c:url value='/category/new' />" class="btn btn-primary custom-width" id="submitbtn" >Add</a></td>
                    </div>
                </table>
            </div>

        </div>

        <button onclick="loadCategories" id="showCategories">SHOW CATEGORIES</button>
        <div id="categ"></div>

        <script>
            document.getElementById("showCategories").addEventListener("click", loadCategories);

            function loadCategories() {

                var xhr = new XMLHttpRequest();

                xhr.open("GET", "/ProductBoot/categoryrest/", true);

                xhr.onload = function () {
                    if (this.status == 200) {
                        var categories = JSON.parse(xhr.responseText);
                        var output = "<table class='table'>";
                        for (var i in categories) {
                            output += 
                                    "<tr><td>" + categories[i].id + "</td>"
                                 + "<td>" + categories[i].categoryName + "</td>"
                                 +  " <td><a href='/ProductBoot/category/edit/" + categories[i].id + "' class='btn btn-warning custom-width'>Edit</a></td></ tr></br>" 
                                 +  "<td><a href='/ProductBoot/category/delete/" + categories[i].id + "'  class='btn btn-danger custom-width'>Delete</a></td>";
                        }
                        output += "</table>";
                        document.getElementById("categ").innerHTML = output;
                    }
                }

                xhr.send();
            }

        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>