package com.supermarketTeam.dto;

import java.math.BigDecimal;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import com.supermarketTeam.entities.Category;
import com.supermarketTeam.entities.MeasurementType;

public class ProductRegistrationDto {

    @NotEmpty
    private String name;

    @NotEmpty
    private String brand;

    @NotNull
    private int quantity;

    @NotNull
    private double price;

    @NotNull
    private boolean bio;

    @NotNull
    private Category categoryId;

    @NotNull
    private MeasurementType measurementId;

    @NotEmpty
    private String image;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isBio() {
        return bio;
    }

    public void setBio(boolean bio) {
        this.bio = bio;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public MeasurementType getMeasurementId() {
        return measurementId;
    }

    public void setMeasurementId(MeasurementType measurementId) {
        this.measurementId = measurementId;
    }

}
