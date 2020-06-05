package com.supermarketTeam.services;

import com.supermarketTeam.dao.MyOrderRepository;
import com.supermarketTeam.entities.MyOrder;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class MyOrderServiceImpl implements IMyOrderService {

    @Autowired
    private MyOrderRepository myOrderRepo;

    @Override
    public MyOrder findById(int id) {
        return myOrderRepo.findById(id).get();
    }

    @Override
    public List<MyOrder> listAll() {
        return myOrderRepo.findAll();
    }

    @Override
    public MyOrder save(MyOrder myOrder) {
        MyOrder myGreatOrder = new MyOrder();
        myGreatOrder.setTotalAmount(myOrder.getTotalAmount());
        System.out.println("*********************" + myOrder.getTotalAmount());
        myGreatOrder.setDate(java.time.LocalDate.now());
        return myOrderRepo.save(myGreatOrder);
    }

    @Override
    public void delete(MyOrder myOrder) {
        myOrderRepo.delete(myOrder);
    }

    @Override
    public MyOrder update(MyOrder myOrder) {
        MyOrder dbmyOrder = myOrderRepo.findById(myOrder.getId()).get();
        if (dbmyOrder != null) {
            dbmyOrder.setTotalAmount(myOrder.getTotalAmount());
            return myOrderRepo.save(myOrder);
        }
        return null;
    }

}
