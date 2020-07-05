package com.supermarketTeam.services;

import com.supermarketTeam.entities.MyOrder;
import java.util.List;

public interface IMyOrderService {

    public MyOrder findById(int id);

    public List<MyOrder> listAll();

    public MyOrder save(MyOrder myOrder);

    public void delete(MyOrder myOrder);

    public MyOrder update(MyOrder myOrder);
}
