package com.supermarketTeam.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String viewHomePage(Model model) {
        return "welcome";
    }

    @RequestMapping("/eshop")
    public String viewEShopPage(Model model, HttpServletRequest request) {
        return "productpage";

    }

    @RequestMapping("/chart")
    public String viewChart() {
        return "viewstatistics";

    }

    @RequestMapping("/contact")
    public String viewContactUs() {
        return "contact";

    }

}
