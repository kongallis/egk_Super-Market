package com.supermarketTeam.services;

import com.supermarketTeam.dao.AddressRepository;
import com.supermarketTeam.dto.AddressRegistrationDto;
import com.supermarketTeam.entities.Address;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class AddressServiceImpl implements IAddressService {

    @Autowired
    private AddressRepository repo;

    @Override
    public Address findById(int id) {
        return repo.findById(id).get();
    }

    @Override
    public List<Address> listAll() {
        return repo.findAll();
    }

    @Override
    public Address save(AddressRegistrationDto registration) {
        Address address = new Address();
        address.setAddressName(registration.getAddressName());
        address.setCity(registration.getCity());
        address.setCountry(registration.getCountry());
        address.setPostcode(registration.getPostcode());
        address.setTelephone(registration.getTelephone());
        address.setText(registration.getText());
        address.setUserId(registration.getUserId());
        return repo.save(address);
    }

    @Override
    public void delete(Address address) {
        repo.delete(address);
    }

    @Override
    public Address update(Address address) {
        Address dbAddress = repo.findById(address.getId()).get();
        if (dbAddress != null) {
            dbAddress.setAddressName(address.getAddressName());
            dbAddress.setCity(address.getCity());
            dbAddress.setCountry(address.getCountry());
            dbAddress.setPostcode(address.getPostcode());
            dbAddress.setTelephone(address.getTelephone());
            dbAddress.setText(address.getText());
            dbAddress.setUserId(address.getUserId());
            return repo.save(dbAddress);
        }
        return null;
    }

    @Override
    public Address createOrUpdate(Address address) {
        if (address.getId() != null) {
            return update(address);
        } else {
            Address addr = new Address();
            addr.setAddressName(address.getAddressName());
            addr.setCity(address.getCity());
            addr.setCountry(address.getCountry());
            addr.setPostcode(address.getPostcode());
            addr.setTelephone(address.getTelephone());
            addr.setText(address.getText());
            addr.setUserId(address.getUserId());
            return repo.save(addr);
        }

    }

}
