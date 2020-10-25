package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.domain.Order;
import net.xupypr.myrentcar.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public Iterable<Order> findAll() {
        return orderRepository.findAll();
    }

    @Override
    public Order findById(Long id) {
        Optional<Order> order = orderRepository.findById(id);
        return order.isPresent() ? order.get() : null;
    }

    @Override
    public void save(Order order) {
        orderRepository.save(order);
    }

    @Override
    public void delete(Long id) {
        orderRepository.deleteById(id);
    }

    @Override
    public List<Order> findOrdersByClient(Long clientId) {
        return orderRepository.findOrdersByClient(clientId);
    }

    @Override
    public List<Order> findOrdersByStat1() {
        return orderRepository.findOrdersByStat1();
    }

    @Override
    public List<Order> findOrdersByStat2() {
        return orderRepository.findOrdersByStat2();
    }

    @Override
    public List<Order> findOrdersByStat3() {
        return orderRepository.findOrdersByStat3();
    }
}
