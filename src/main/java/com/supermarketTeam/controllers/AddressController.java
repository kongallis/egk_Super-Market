package com.supermarketTeam.controllers;

import com.supermarketTeam.dto.AddressRegistrationDto;
import com.supermarketTeam.entities.Address;
import com.supermarketTeam.services.AddressServiceImpl;
import java.util.List;
import javax.validation.Valid;
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
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressServiceImpl service;

    @RequestMapping("/")
    public String viewAddressList(Model model) {
        List<Address> addresses = service.listAll();
        model.addAttribute("addresses", addresses);
        return "addresslist";
    }

    @RequestMapping("/new")
    public String showNewAddressPage(Model model) {
        AddressRegistrationDto address = new AddressRegistrationDto();
        model.addAttribute("address", address);
        return "newaddress";
    }

    @PostMapping("/new")
    public String addAddress(@ModelAttribute("address") @Valid AddressRegistrationDto addDto,
            BindingResult result) {
        if (result.hasErrors()) {
            return "/new";
        }
        service.save(addDto);
        return "redirect:/address/";
    }

    @GetMapping("/delete/{id}")
    public String deleteAddress(@PathVariable("id") int id, Model model) {
        Address address = service.findById(id);
        service.delete(address);
        return "redirect:/address/";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editAddress(ModelMap view, @PathVariable int id) {
        Address address = service.findById(id);
        view.addAttribute("address", address);
        return ("editaddress");
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String updateAddress(@Valid Address address, BindingResult result, ModelMap view) {

        if (result.hasErrors()) {
            return "editaddress";
        }
        service.update(address);
        return ("redirect:/address/");
    }

}
