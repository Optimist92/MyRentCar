package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Fuel;
import net.xupypr.myrentcar.repository.FuelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class FuelServiceImpl implements FuelService {

    @Autowired
    private FuelRepository fuelRepository;

    public FuelServiceImpl(FuelRepository fuelRepository) {
        this.fuelRepository = fuelRepository;
    }

    @Override
    public Iterable<Fuel> findAll() {
        return fuelRepository.findAll();
    }

    @Transactional
    @Override
    public Fuel findById(Long id) {
        Optional<Fuel> fuel = fuelRepository.findById(id);
        return fuel.isPresent() ? fuel.get() : null;
    }

    @Transactional
    @Override
    public void save(Fuel fuel) {
        fuelRepository.save(fuel);
    }

    @Transactional
    @Override
    public void delete(Long id) {
        fuelRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            fuelRepository.deleteById(id);
        }
    }
}
