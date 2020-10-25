package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query(value = "SELECT o FROM Order o WHERE o.client.id = ?1")
    List<Order> findOrdersByClient (Long clientId);

    @Query(value = "SELECT o FROM Order o WHERE o.statusOrder.id = 1")
    List<Order> findOrdersByStat1 ();

    @Query(value = "SELECT o FROM Order o WHERE o.statusOrder.id = 2")
    List<Order> findOrdersByStat2 ();

    @Query(value = "SELECT o FROM Order o WHERE o.statusOrder.id = 3")
    List<Order> findOrdersByStat3 ();


}
