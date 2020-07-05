package com.supermarketTeam.dto;

import javax.validation.constraints.NotEmpty;

public class CategoryRegistrationDto {

    @NotEmpty
    private String categoryName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
