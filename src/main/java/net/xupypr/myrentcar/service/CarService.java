package net.xupypr.myrentcar.service;



import net.xupypr.myrentcar.domain.Car;

import java.util.List;


public interface CarService {
    Iterable<Car> findAll();// throws LogicException;

    Car findById (Long id);// throws LogicException;

    void save(Car car);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;
}
