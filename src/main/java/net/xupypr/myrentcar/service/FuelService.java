package net.xupypr.myrentcar.service;


import net.xupypr.myrentcar.domain.Fuel;

import java.util.List;

public interface FuelService {
    Iterable<Fuel> findAll();// throws LogicException;

    Fuel findById (Long id);// throws LogicException;

    void save(Fuel fuel);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;
}
