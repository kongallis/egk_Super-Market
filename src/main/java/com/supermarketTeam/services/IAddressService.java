package com.supermarketTeam.services;

import com.supermarketTeam.dto.AddressRegistrationDto;
import com.supermarketTeam.entities.Address;
import java.util.List;

public interface IAddressService {

    public Address findById(int id);

    public List<Address> listAll();

    public Address save(AddressRegistrationDto registration);

    public void delete(Address address);

    public Address update(Address address);

    public Address createOrUpdate(Address address);

}
