package com.supermarketTeam.controllers;

import com.supermarketTeam.dto.MeasurementTypeRegistrationDto;
import com.supermarketTeam.entities.MeasurementType;
import com.supermarketTeam.services.MeasurementTypeImpl;
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
@RequestMapping("/mtype")
public class MeasureController {

    @Autowired
    private MeasurementTypeImpl measureService;

    @RequestMapping("/")
    public String viewMeasurementPage(Model view) {
        List<MeasurementType> mTypes = measureService.listAll();
        view.addAttribute("mTypes", mTypes);
        return "mtypelist";
    }

    @RequestMapping("/new")
    public String newMeasureTypePage(Model model) {
        MeasurementType mType = new MeasurementType();
        model.addAttribute("mType", mType);
        return "newmtype";
    }

    @PostMapping("/new")
    public String addMeasurementType(@ModelAttribute("mType") @Valid MeasurementTypeRegistrationDto mType,
            BindingResult result) {
        if (result.hasErrors()) {
            return "newmtype";
        }
        measureService.save(mType);
        return "redirect:/mtype/";
    }

    @GetMapping("/delete/{id}")
    public String deleteMType(@PathVariable("id") int id, Model model) {
        MeasurementType mType = measureService.findById(id);
        measureService.delete(mType);
        return "redirect:/mtype/";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editMType(ModelMap view, @PathVariable int id) {
        MeasurementType mType = measureService.findById(id);
        view.addAttribute("mType", mType);
        return ("editmtype");
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String updateMType(@Valid MeasurementType mType, BindingResult result, ModelMap view) {

        if (result.hasErrors()) {
            return "editmtype";
        }
        measureService.update(mType);
        return ("redirect:/mtype/");
    }
}
