<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            .site-footer
            {
                background-color:#26272b;
                padding:45px 0 20px;
                font-size:15px;
                font-weight: 500;
                line-height:24px;
                color:#737373;
                margin-top: 40px;
            }
            .site-footer hr
            {
                border-top-color:#bbb;
                opacity:0.5
            }
            .site-footer hr.small
            {
                margin:20px 0
            }
            .site-footer h6
            {
                color:#fff;
                font-size:16px;
                text-transform:uppercase;
                margin-top:5px;
                letter-spacing:2px
            }
            .site-footer a
            {
                color:#737373;
            }
            .site-footer a:hover
            {
                color:#3366cc;
                text-decoration:none;
            }
            .footer-links
            {
                padding-left:0;
                list-style:none
            }
            .footer-links li
            {
                display:block
            }
            .footer-links a
            {
                color:#737373
            }
            .footer-links a:active,.footer-links a:focus,.footer-links a:hover
            {
                color:#3366cc;
                text-decoration:none;
            }
            .footer-links.inline li
            {
                display:inline-block
            }
            .site-footer .social-icons
            {
                text-align:right
            }
            .site-footer .social-icons a
            {
                width:40px;
                height:40px;
                line-height:40px;
                margin-left:6px;
                margin-right:0;
                border-radius:100%;
                background-color:#33353d
            }
            .copyright-text
            {
                margin:0
            }
            @media (max-width:991px)
            {
                .site-footer [class^=col-]
                {
                    margin-bottom:30px
                }
            }
            @media (max-width:767px)
            {
                .site-footer
                {
                    padding-bottom:0
                }
                .site-footer .copyright-text,.site-footer .social-icons
                {
                    text-align:center
                }
            }
            .social-icons
            {
                padding-left:0;
                margin-bottom:0;
                list-style:none
            }
            .social-icons li
            {
                display:inline-block;
                margin-bottom:4px
            }
            .social-icons li.title
            {
                margin-right:15px;
                text-transform:uppercase;
                color:#96a2b2;
                font-weight:700;
                font-size:13px
            }
            .social-icons a{
                background-color:#eceeef;
                color:#818a91;
                font-size:16px;
                display:inline-block;
                line-height:44px;
                width:44px;
                height:44px;
                text-align:center;
                margin-right:8px;
                border-radius:100%;
                -webkit-transition:all .2s linear;
                -o-transition:all .2s linear;
                transition:all .2s linear
            }
            .social-icons a:active,.social-icons a:focus,.social-icons a:hover
            {
                color:#fff;
                background-color:#29aafe
            }
            .social-icons.size-sm a
            {
                line-height:34px;
                height:34px;
                width:34px;
                font-size:14px
            }
            .social-icons a.facebook:hover
            {
                background-color:#3b5998
            }
            .social-icons a.twitter:hover
            {
                background-color:#00aced
            }
            .social-icons a.linkedin:hover
            {
                background-color:#007bb6
            }
            .social-icons a.dribbble:hover
            {
                background-color:#ea4c89
            }
            @media (max-width:767px)
            {
                .social-icons li.title
                {
                    display:block;
                    margin-right:0;
                    font-weight:600
                }
            }
            .submit{
                background-color: whitesmoke;
                border-radius: 5px;
            }
            .titlenews{
                color:#fff;
                font-size:16px;
            }
            #subbtn{
                background-color: white;
            }

        </style>
    </head>
    <body>

        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6>About</h6>
                        <p class="text-justify">Our Commitment to Ethics
                            At EGK, our shared values support an ethical culture and
                            are the foundation of our commitment to conduct our business by doing
                            what’s right, every day. Our Code of Ethics supports this commitment
                            by outlining four ethical principles that can be applied in our everyday work.
                        </p>
                    </div>

                    <div class="col-xs-6 col-md-2">
                        <h6>Categories</h6>
                        <ul class="footer-links">
                            <li>Vegetables</li>
                            <li>Fruits</li>
                            <li>Meat & Fish</li>
                            <li>Soft Drinks</li>
                            <li>Alcohol</li>
                            <li>Cleaning</li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-md-2">
                        <h6>Quick Links</h6>
                        <ul class="footer-links">
                            <li>About Us</li>
                            <li>Contact Us</li>
                            <li>Contribute</li>
                            <li>Privacy Policy</li>
                            <li>Sitemap</li>
                        </ul>
                    </div>
                    <div class="col-xs-6 col-md-2">
                        <a class="titlenews">Newsletter</a>
                        <form class="secondary-form" id="newsletter-subscription-form" data-standalone-validation="true" novalidate="novalidate">
                            <div class="form-group clearfix">
                                <label for="newsletterEmail" class="hidden"></label>
                                <input name="email" type="email" id="newsletterEmail" class="email  col-xs-60" placeholder="Email*">
                                <input id="subbtn" class="btn mt-3" type="submit" value="Subscribe">
                                <p class="message-error hidden"></p>
                            </div>

                            <div class="server-answer" id="newsletter-form-submission-response"></div>
                    </div>
                </div>
                <hr>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-6 col-xs-12">
                        <p class="copyright-text">Copyright &copy; 2020 All Rights Reserved by
                            <a href="#">Supermarket Team</a>.
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <ul class="social-icons">
                            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
