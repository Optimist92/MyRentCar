package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Transmission;
import net.xupypr.myrentcar.repository.TransmissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class TransmissionServiceImpl implements TransmissionService{

    @Autowired
    private TransmissionRepository transmissionRepository;

    public TransmissionServiceImpl(TransmissionRepository transmissionRepository) {
        this.transmissionRepository = transmissionRepository;
    }

    @Override
    @Transactional
    public Iterable<Transmission> findAll() {
        return transmissionRepository.findAll();
    }

    @Override
    @Transactional
    public Transmission findById(Long id) {
        Optional<Transmission> transmission = transmissionRepository.findById(id);
        return transmission.isPresent() ? transmission.get() : null;
    }

    @Override
    @Transactional
    public void save(Transmission transmission) {
        transmissionRepository.save(transmission);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        transmissionRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            transmissionRepository.deleteById(id);
        }
    }
}
