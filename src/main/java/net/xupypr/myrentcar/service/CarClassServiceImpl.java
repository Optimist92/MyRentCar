package net.xupypr.myrentcar.service;


import net.xupypr.myrentcar.domain.CarClass;
import net.xupypr.myrentcar.repository.CarClassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


@Service
public class CarClassServiceImpl implements CarClassService {

    @Autowired
    private CarClassRepository carClassRepository;

    public CarClassServiceImpl(CarClassRepository carClassRepository) {
        this.carClassRepository = carClassRepository;
    }

    @Transactional
    @Override
    public Iterable<CarClass> findAll() {
        return carClassRepository.findAll();
    }

    @Transactional
    @Override
    public CarClass findById(Long id) {
        Optional<CarClass> carClass = carClassRepository.findById(id);
        return carClass.isPresent() ? carClass.get() : null;
    }

    @Transactional
    @Override
    public void save(CarClass carClass) {
        carClassRepository.save(carClass);
    }

    @Transactional
    @Override
    public void delete(Long id) {
        carClassRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            carClassRepository.deleteById(id);
        }
    }
}
