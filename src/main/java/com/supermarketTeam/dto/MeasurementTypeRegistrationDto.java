package com.supermarketTeam.dto;

import javax.validation.constraints.NotEmpty;

public class MeasurementTypeRegistrationDto {

    @NotEmpty
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
