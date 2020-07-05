<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Contact us</title>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }
            * {
                box-sizing: border-box;
            }

            input[type="text"],
            select,
            textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-top: 6px;
                margin-bottom: 16px;
                resize: vertical;
            }

            input[type="submit"] {
                background-color: #7cc2af; /* Να μπει το χρώμα μας (Submit button) */
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049; /* Να μπει το χρώμα μας (Submit button) */
            }

            .container {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }
            .mapouter {
                position: relative;
                text-align: right;
                height: 500px;
                width: 500px;
                display: flex;
                margin: 0 auto;
            }
            .gmap_canvas {
                overflow: hidden;
                background: none !important;
                height: 500px;
                width: 500px;
            }
            .ourLocation {
                display: flex;
                justify-content: center;
            }
            .contactForm {
                display: flex;
                justify-content: center;
                margin: 0 15%;
                flex-direction: column;
            }
            .contactSite {
                display: flex;
                flex-direction: column;
                justify-content: center;
                font-size: 16px;
            }
            .contactSite h3{
                font-weight: 800;
                font-size: 18px;
                text-align: center;
            }
        </style>
        <jsp:include page="headerWithShopCart.jsp" />
    </head>
    <body>
        <br>
        <br>
        <div class="contactSite">
            <div class="contactForm">
                <div class="container">
                    <h3>Contact Form</h3>
                    <br>
                    <form action="" method="GET" >
                        <label for="fname">First Name</label>
                        <input type="text" id="fname" name="firstname" placeholder="Your name.."/>

                        <label for="lname">Last Name</label>
                        <input type="text" id="lname" name="lastname" placeholder="Your last name.."/>

                        <label for="country">Country</label>
                        <select id="country" name="country">
                            <option value="greece">Greece</option>
                            <option value="cyprus">Cyprus</option>
                        </select>

                        <label for="subject">Subject</label>
                        <textarea id="subject" name="subject" placeholder="Write your message here" style="height: 200px;"></textarea>

                        <input type="submit" value="Submit" />
                    </form>
                </div>
            </div>
            <div class="ourLocation"><h2>You can find us here:</h2></div>

            <div class="mapouter">
                <div class="gmap_canvas">
                    <iframe width="500" height="310" id="gmap_canvas" src="https://maps.google.com/maps?q=panepistimiou%2039&t=&z=19&ie=UTF8&iwloc=&output=embed" frameborder="0"
                            scrolling="no" marginheight="0" marginwidth="0"></iframe>
                </div>
            </div>
        </div>
    </body>
</html>

