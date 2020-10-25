package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.domain.CarModel;
import net.xupypr.myrentcar.domain.Price;
import net.xupypr.myrentcar.repository.CarModelRepository;
import net.xupypr.myrentcar.repository.PriceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class CarModelServiceImpl implements CarModelService{

    @Autowired
    private CarModelRepository carModelRepository;

    @Autowired
    private PriceRepository priceRepository;

    public CarModelServiceImpl(CarModelRepository carModelRepository) {
        this.carModelRepository = carModelRepository;
    }

    @Override
    @Transactional
    public Iterable<CarModel> findAll() {
        return carModelRepository.findAll();
    }

    @Override
    @Transactional
    public CarModel findById(Long id) {
        Optional<CarModel> carModel = carModelRepository.findById(id);
        return carModel.isPresent() ? carModel.get() : null;
    }

    @Override
    @Transactional
    public void save(CarModel model, Price price) {
        carModelRepository.save(model);
        priceRepository.save(price);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        carModelRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            carModelRepository.deleteById(id);
        }
    }


}
