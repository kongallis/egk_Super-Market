package com.supermarketTeam.services;

import com.supermarketTeam.dao.CategoryRepository;
import com.supermarketTeam.dto.CategoryRegistrationDto;
import com.supermarketTeam.entities.Category;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private CategoryRepository cateRepo;

    @Override
    public Category findById(int id) {
        return cateRepo.findById(id).get();
    }

    @Override
    public List<Category> listAll() {
        return cateRepo.findAll();
    }

    @Override
    public Category save(CategoryRegistrationDto registration) {
        Category category = new Category();

        category.setCategoryName(registration.getCategoryName());
        return cateRepo.save(category);
    }

    @Override
    public void delete(Category category) {
        cateRepo.delete(category);
    }

    @Override
    public Category update(Category category) {
        Category dbCategory = cateRepo.findById(category.getId()).get();
        if (dbCategory != null) {
            dbCategory.setCategoryName(category.getCategoryName());
            return cateRepo.save(category);
        }
        return null;
    }

}
