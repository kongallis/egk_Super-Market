package com.supermarketTeam.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.supermarketTeam.dto.MeasurementTypeRegistrationDto;
import com.supermarketTeam.entities.MeasurementType;
import com.supermarketTeam.services.MeasurementTypeImpl;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/mtyperest")
public class MeasurementTypeRestController {

    public static final Logger logger = LoggerFactory.getLogger(MeasurementTypeRestController.class);

    @Autowired
    private MeasurementTypeImpl serviceMType;

    @GetMapping(value = "/", produces = "application/json")
    public List<MeasurementType> listAllMTypes() {
        return serviceMType.listAll();
    }

    @GetMapping(value = "/{id}", produces = "application/json")
    public MeasurementType getSingleMType(@PathVariable("id") int id) {
        MeasurementType mType = serviceMType.findById(id);
        return mType;
    }

    @PostMapping(produces = "application/json", consumes = "application/json")
    public MeasurementType saveMType(@RequestBody MeasurementTypeRegistrationDto registration) {
        return serviceMType.save(registration);
    }

    @PutMapping(value = "/{id}", produces = "application/json", consumes = "application/json")
    public MeasurementType updateMType(@PathVariable(value = "id") int id, @RequestBody MeasurementTypeRegistrationDto registration) {
        MeasurementType mType = serviceMType.findById(id);
        mType.setType(registration.getType());
        return serviceMType.update(mType);
    }

    @DeleteMapping(value = "/{id}")
    public void deleteMType(@PathVariable(value = "id") int id) {
        MeasurementType mType = serviceMType.findById(id);
        serviceMType.delete(mType);
    }

}
