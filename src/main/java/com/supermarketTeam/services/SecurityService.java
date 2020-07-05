package com.supermarketTeam.services;

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
