package com.supermarketTeam.controllers;

import java.util.List;
import javax.validation.Valid;
import com.supermarketTeam.dto.ProductRegistrationDto;
import com.supermarketTeam.entities.Category;
import com.supermarketTeam.entities.MeasurementType;
import com.supermarketTeam.entities.Product;
import com.supermarketTeam.services.CategoryServiceImpl;
import com.supermarketTeam.services.MeasurementTypeImpl;
import com.supermarketTeam.services.ProductServiceImpl;
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
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductServiceImpl service;

    @Autowired
    private CategoryServiceImpl serviceCategory;

    @Autowired
    private MeasurementTypeImpl measureService;

    @RequestMapping("/")
    public String viewHomePage(Model model, HttpServletRequest request) {
        List<Product> products = service.listAll();
        model.addAttribute("products", products);

        return "productlist";
    }

    @RequestMapping("/new")
    public String showNewProductPage(Model model) {
        ProductRegistrationDto product = new ProductRegistrationDto();
        List<Category> categoryList = serviceCategory.listAll();
        List<MeasurementType> mTypeList = measureService.listAll();
        model.addAttribute("product", product);
        model.addAttribute("mTypeList", mTypeList);
        model.addAttribute("categoryList", categoryList);
        return "newproduct";
    }

    @PostMapping("/new")
    public String addProduct(@ModelAttribute("product") @Valid ProductRegistrationDto prodDto,
            BindingResult result) {
        if (result.hasErrors()) {
            return "/newproduct";
        }
        service.save(prodDto);
        return "redirect:/product/";
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id, Model model) {
        Product product = service.findById(id);
        service.delete(product);
        return "redirect:/product/";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editProduct(ModelMap view, @PathVariable int id) {
        Product product = service.findById(id);
        List<Category> categoryList = serviceCategory.listAll();
        List<MeasurementType> mTypeList = measureService.listAll();
        view.addAttribute("product", product);
        view.addAttribute("mTypeList", mTypeList);
        view.addAttribute("categoryList", categoryList);
        return ("editproduct");
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String updateProduct(@Valid Product product, BindingResult result, ModelMap view) {

        if (result.hasErrors()) {
            return "editproduct";
        }
        service.update(product);
        return ("redirect:/product/");
    }
}
