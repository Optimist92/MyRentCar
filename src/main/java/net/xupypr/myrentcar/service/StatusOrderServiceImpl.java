package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.domain.StatusOrder;
import net.xupypr.myrentcar.repository.StatusOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class StatusOrderServiceImpl implements StatusOrderService{

    @Autowired
    private StatusOrderRepository statusOrderRepository;

    @Override
    public Iterable<StatusOrder> findAll() {
        return statusOrderRepository.findAll();
    }

    @Override
    public StatusOrder findById(Long id) {
        Optional<StatusOrder> statusOrder = statusOrderRepository.findById(id);
        return statusOrder.isPresent() ? statusOrder.get() : null;
    }

    @Override
    public void save(StatusOrder statusOrder) {
        statusOrderRepository.save(statusOrder);
    }

    @Override
    public void delete(Long id) {
        statusOrderRepository.deleteById(id);
    }
}
