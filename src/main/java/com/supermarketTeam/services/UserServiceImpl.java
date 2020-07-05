package com.supermarketTeam.services;

import com.supermarketTeam.dao.RoleRepository;
import com.supermarketTeam.dao.UserRepository;
import com.supermarketTeam.entities.User;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(Arrays.asList(roleRepository.findByName("ROLE_USER")));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public List<User> listAll() {
        return userRepository.findAll();
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }

    @Override
    public User update(User user) {
        User dbuser = userRepository.findById(user.getId()).get();
        if (dbuser != null) {
            dbuser.setUsername(user.getUsername());
            dbuser.setFirstName(user.getFirstName());
            dbuser.setLastName(user.getLastName());
            dbuser.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            return userRepository.save(dbuser);
        }
        return null;
    }

}
