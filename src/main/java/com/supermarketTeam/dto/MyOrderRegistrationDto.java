package com.supermarketTeam.dto;

import java.time.LocalDate;
import javax.validation.constraints.NotEmpty;

public class MyOrderRegistrationDto {

    @NotEmpty
    private double totalAmount;

    @NotEmpty
    private LocalDate date;

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

}
