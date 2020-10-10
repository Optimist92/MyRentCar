package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.CarClass;

import java.util.List;

public interface CarClassService {
    Iterable<CarClass> findAll();// throws LogicException;

    CarClass findById (Long id);// throws LogicException;

    void save(CarClass carClass);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;
}
