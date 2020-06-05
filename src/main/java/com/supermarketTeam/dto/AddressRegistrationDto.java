package com.supermarketTeam.dto;

import com.supermarketTeam.entities.User;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class AddressRegistrationDto {

    @NotEmpty
    @Size(min = 1, max = 40)
    private String addressName;

    @NotEmpty
    @Size(min = 1, max = 30)
    private String city;

    @NotEmpty
    @Size(min = 1, max = 30)
    private String country;

    @NotEmpty
    @Size(min = 1, max = 12)
    private String postcode;

    @NotEmpty
    @Size(min = 1, max = 12)
    private String telephone;

    @NotEmpty
    @Size(max = 255)
    private String text;

    @NotNull
    private User userId;

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

}
