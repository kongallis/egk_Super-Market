package com.supermarketTeam.services;

import com.supermarketTeam.entities.User;
import java.util.List;

public interface UserService {

    void save(User user);

    User findByUsername(String username);

    User findByEmail(String email);

    public List<User> listAll();

    public void delete(User user);

    public User update(User user);

}
