package com.supermarketTeam.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.supermarketTeam.dto.ProductRegistrationDto;
import com.supermarketTeam.entities.Product;
import com.supermarketTeam.services.ProductServiceImpl;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/productrest")
public class AppRestController {

    public static final Logger logger = LoggerFactory.getLogger(MeasurementTypeRestController.class);

    @Autowired
    private ProductServiceImpl service;

    @GetMapping(value = "/", produces = "application/json")
    public List<Product> listAllProducts() {
        return service.listAll();
    }

    @GetMapping(value = "/{id}", produces = "application/json")
    public Product getSingleProduct(@PathVariable("id") int id) {
        Product product = service.findById(id);
        return product;

    }

    @PostMapping(produces = "application/json", consumes = "application/json")
    public Product saveProduct(@RequestBody ProductRegistrationDto registration) {
        return service.save(registration);
    }

    @PutMapping(value = "/{id}", produces = "application/json", consumes = "application/json")
    public Product updateProduct(@PathVariable(value = "id") int id, @RequestBody ProductRegistrationDto registration) {
        Product product = service.findById(id);
        product.setName(registration.getName());
        product.setBrand(registration.getBrand());
        product.setQuantity(registration.getQuantity());
        product.setPrice(registration.getPrice());
        product.setBio(registration.isBio());
        product.setCategoryId(registration.getCategoryId());
        product.setMeasurementId(registration.getMeasurementId());
        product.setImage(registration.getImage());
        return service.update(product);
    }

    @DeleteMapping(value = "/{id}")
    public void deleteProduct(@PathVariable(value = "id") int id) {
        Product product = service.findById(id);
        service.delete(product);

    }

}
