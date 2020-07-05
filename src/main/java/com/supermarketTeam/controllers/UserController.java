package com.supermarketTeam.controllers;

import java.util.List;
import javax.validation.Valid;
import com.supermarketTeam.entities.User;
import com.supermarketTeam.services.UserServiceImpl;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/")
    public String viewUser(Model model, HttpServletRequest request) {
        List<User> users = userService.listAll();
        model.addAttribute("users", users);

        return "userlist";
    }

    @RequestMapping("/new")
    public String newUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "newuser";
    }

    @PostMapping("/new")
    public String addUser(@ModelAttribute("user") @Valid User user,
            BindingResult result) {
        if (result.hasErrors()) {
            return "/newuser";
        }
        userService.save(user);
        return "redirect:/user/";
    }

    @GetMapping("/delete/{email}")
    public String deleteUser(@PathVariable("email") String email, Model model) {
        User user = userService.findByEmail(email);
        userService.delete(user);
        return "redirect:/user/";
    }

    @RequestMapping(value = "/edit/{email}", method = RequestMethod.GET)
    public String editProduct(ModelMap view, @PathVariable String email) {
        User user = userService.findByEmail(email);
        view.addAttribute("user", user);
        return ("edituser");
    }

    @RequestMapping(value = "/edit/{email}", method = RequestMethod.POST)
    public String updateProduct(@Valid User user, BindingResult result, ModelMap view) {

        if (result.hasErrors()) {
            return "edituser";
        }
        userService.update(user);
        return ("redirect:/user/");
    }
}
