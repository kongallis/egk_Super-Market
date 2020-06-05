package com.supermarketTeam.controllers;

import com.supermarketTeam.entities.MyOrder;
import com.supermarketTeam.services.MyOrderServiceImpl;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orderrest")
public class OrderRestController {

    public static final Logger logger = LoggerFactory.getLogger(OrderRestController.class);

    @Autowired
    private MyOrderServiceImpl serviceMyOrder;

    @GetMapping(value = "/", produces = "application/json")
    public List<MyOrder> listAllMyOrders() {
        return serviceMyOrder.listAll();
    }

    @GetMapping(value = "/{id}", produces = "application/json")
    public MyOrder getOneOrder(@PathVariable("id") int id) {
        MyOrder myOrder = serviceMyOrder.findById(id);
        return myOrder;

    }

    @PostMapping(produces = "application/json", consumes = "application/json")
    public MyOrder saveOrder(@RequestBody MyOrder myOrder) {
        System.out.println(myOrder);
        return serviceMyOrder.save(myOrder);
    }

}
