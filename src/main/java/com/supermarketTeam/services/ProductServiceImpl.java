package com.supermarketTeam.services;

import java.util.List;
import javax.transaction.Transactional;
import com.supermarketTeam.dto.ProductRegistrationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.supermarketTeam.dao.ProductRepository;
import com.supermarketTeam.entities.Product;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductRepository repo;

    public List<Product> listAll() {
        return repo.findAll();
    }

    public Product save(ProductRegistrationDto registration) {
        Product product = new Product();

        product.setName(registration.getName());
        product.setBrand(registration.getBrand());
        product.setQuantity(registration.getQuantity());
        product.setPrice(registration.getPrice());
        product.setBio(registration.isBio());
        product.setCategoryId(registration.getCategoryId());
        product.setMeasurementId(registration.getMeasurementId());
        product.setImage(registration.getImage());
        return repo.save(product);
    }

    public void delete(Product product) {
        repo.delete(product);
    }

    public Product findById(int id) {
        return repo.findById(id).get();
    }

    public Product update(Product product) {
        Product dbProduct = repo.findById(product.getId()).get();
        if (dbProduct != null) {
            dbProduct.setName(product.getName());
            dbProduct.setBrand(product.getBrand());
            dbProduct.setQuantity(product.getQuantity());
            dbProduct.setPrice(product.getPrice());
            dbProduct.setBio(product.getBio());
            dbProduct.setMeasurementId(product.getMeasurementId());
            dbProduct.setImage(product.getImage());
            return repo.save(product);
        }
        return null;
    }
}
