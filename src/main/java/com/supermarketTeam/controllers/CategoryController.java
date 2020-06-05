package com.supermarketTeam.controllers;

import com.supermarketTeam.dto.CategoryRegistrationDto;
import com.supermarketTeam.entities.Category;
import com.supermarketTeam.services.CategoryServiceImpl;
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

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryServiceImpl serviceCategory;

    @RequestMapping("/")
    public String viewCategories(Model cateModel) {
        List<Category> categories = serviceCategory.listAll();
        cateModel.addAttribute("categories", categories);
        return "categorylist";
    }

    @GetMapping("/new")
    public String addCategory(Model model) {
        CategoryRegistrationDto category = new CategoryRegistrationDto();
        model.addAttribute("category", category);
        return "newcategory";
    }

    @PostMapping("/new")
    public String addCategory(@ModelAttribute("model") @Valid CategoryRegistrationDto catDto,
            BindingResult result) {
        if (result.hasErrors()) {
            return "newcategory";
        }
        serviceCategory.save(catDto);
        return "redirect:/category/";
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") int id, Model model) {
        Category category = serviceCategory.findById(id);
        serviceCategory.delete(category);
        return "redirect:/category/";
    }

    @GetMapping("edit/{id}")
    public String editCategory(ModelMap view, @PathVariable int id) {
        Category category = serviceCategory.findById(id);
        view.addAttribute("category", category);
        return ("editcategory");
    }

    @PostMapping("edit/{id}")
    public String updateCategory(@Valid Category category, BindingResult result, ModelMap view) {
        if (result.hasErrors()) {
            return "editcategory";
        }
        serviceCategory.update(category);
        return ("redirect:/category/");
    }
}
