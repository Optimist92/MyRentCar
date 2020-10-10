package net.xupypr.myrentcar.service;


import net.xupypr.myrentcar.domain.Price;

import java.util.List;

public interface PriceService {
    Iterable<Price> findAll();// throws LogicException;

    Price findById (Long id);// throws LogicException;

    void save(Price price);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;
}
