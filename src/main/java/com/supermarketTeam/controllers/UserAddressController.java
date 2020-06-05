package com.supermarketTeam.controllers;

import com.supermarketTeam.entities.Address;
import com.supermarketTeam.entities.User;
import com.supermarketTeam.services.AddressServiceImpl;
import com.supermarketTeam.services.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserAddressController {

    @Autowired
    private UserService userService;
    @Autowired
    private AddressServiceImpl service;

    @RequestMapping(value = "/useraddress/{email}", method = RequestMethod.GET)
    public String editUserAddress(ModelMap view, @PathVariable String email) {
        User user = userService.findByEmail(email);
        Address address = null;
        if (!user.getAddressList().isEmpty()) {
            address = user.getAddressList().get(0);
        } else {
            address = new Address();
        }
        view.addAttribute("address", address);
        view.addAttribute("user", user);
        return ("useraddress");
    }

    @RequestMapping(value = "/useraddress/{email}", method = RequestMethod.POST)
    public String updateUserAddress(@Valid Address address, BindingResult result, ModelMap view) {

        if (result.hasErrors()) {
            return "useraddress";
        }
        service.createOrUpdate(address);
        return "payout";
    }

    @RequestMapping(value = "/useraddress", method = RequestMethod.GET)
    public String getUserAddress(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetail = (UserDetails) auth.getPrincipal();
        User u = userService.findByUsername(userDetail.getUsername());
        return "redirect:/useraddress/" + u.getEmail();
    }

}
