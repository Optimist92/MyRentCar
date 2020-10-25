package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Price;
import net.xupypr.myrentcar.domain.StatusOrder;

public interface StatusOrderService {
    Iterable<StatusOrder> findAll();

    StatusOrder findById (Long id);

    void save(StatusOrder statusOrder);

    void delete(Long id);
}
