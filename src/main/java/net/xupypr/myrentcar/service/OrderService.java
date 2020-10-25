package net.xupypr.myrentcar.service;


import net.xupypr.myrentcar.domain.Order;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderService {
    Iterable<Order> findAll();

    Order findById (Long id);

    void save(Order order);

    void delete(Long id);

    List<Order> findOrdersByClient (Long clientId);

    List<Order> findOrdersByStat1 ();

    List<Order> findOrdersByStat2 ();

    List<Order> findOrdersByStat3 ();
}
