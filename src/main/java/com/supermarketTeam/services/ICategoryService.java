package com.supermarketTeam.services;

import com.supermarketTeam.dto.CategoryRegistrationDto;
import com.supermarketTeam.entities.Category;
import java.util.List;

public interface ICategoryService {

    public Category findById(int id);

    public List<Category> listAll();

    public Category save(CategoryRegistrationDto registration);

    public void delete(Category category);

    public Category update(Category category);

}
