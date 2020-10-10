package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Price;
import net.xupypr.myrentcar.repository.PriceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class PriceServiceImpl implements PriceService {

    @Autowired
    private PriceRepository priceRepository;

    public PriceServiceImpl(PriceRepository priceRepository) {
        this.priceRepository = priceRepository;
    }

    @Override
    @Transactional
    public Iterable<Price> findAll() {
        return priceRepository.findAll();
    }

    @Override
    @Transactional
    public Price findById(Long id) {
        Optional<Price> price = priceRepository.findById(id);
        return price.isPresent() ? price.get() : null;
    }

    @Override
    @Transactional
    public void save(Price price) {
        priceRepository.save(price);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        priceRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            priceRepository.deleteById(id);
        }
    }
}
