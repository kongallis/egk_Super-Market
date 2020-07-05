package com.supermarketTeam.dao;

import com.supermarketTeam.entities.MyOrder;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MyOrderRepository extends JpaRepository<MyOrder, Integer> {

}
