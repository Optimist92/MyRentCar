package net.xupypr.myrentcar.service;



import net.xupypr.myrentcar.domain.CarModel;

import java.util.List;

public interface CarModelService {
    Iterable<CarModel> findAll();// throws LogicException;

    CarModel findById (Long id);// throws LogicException;

    void save(CarModel model);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;
}
