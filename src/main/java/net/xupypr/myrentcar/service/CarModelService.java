package net.xupypr.myrentcar.service;



import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.domain.CarModel;
import net.xupypr.myrentcar.domain.Price;

import javax.transaction.Transactional;
import java.util.List;

public interface CarModelService {
    Iterable<CarModel> findAll();// throws LogicException;

    CarModel findById (Long id);// throws LogicException;

    void save(CarModel model, Price price);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;



}
