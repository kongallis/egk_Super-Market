package com.supermarketTeam.services;

import com.supermarketTeam.dto.ProductRegistrationDto;
import com.supermarketTeam.entities.Product;
import java.util.List;

public interface IProductService {

    public Product findById(int id);

    public List<Product> listAll();

    public Product save(ProductRegistrationDto registration);

    public void delete(Product product);

    public Product update(Product product);
}
