package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class CarServiceImpl implements CarService{

    @Autowired
    private CarRepository carRepository;

    public CarServiceImpl(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    @Override
    @Transactional
    public Iterable<Car> findAll() {
        return carRepository.findAll();
    }

    @Override
    @Transactional
    public Car findById(Long id) {
        Optional<Car> car = carRepository.findById(id);
        return car.isPresent() ? car.get() : null;
    }

    @Override
    @Transactional
    public void save(Car car) {
        carRepository.save(car);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        carRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            carRepository.deleteById(id);
        }
    }
}
