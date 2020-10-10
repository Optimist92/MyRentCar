package net.xupypr.myrentcar.service;


import net.xupypr.myrentcar.domain.Type;
import net.xupypr.myrentcar.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class TypeServiceImpl implements TypeService{

    @Autowired
    private TypeRepository typeRepository;

    public TypeServiceImpl(TypeRepository typeRepository) {
        this.typeRepository = typeRepository;
    }


    @Override
    @Transactional
    public Iterable<Type> findAll() {
        return typeRepository.findAll();
    }


    @Override
    @Transactional
    public Type findById(Long id) {
        Optional<Type> type = typeRepository.findById(id);
        return type.isPresent() ? type.get() : null;
    }


    @Override
    @Transactional
    public void save(Type type) {
        typeRepository.save(type);
    }


    @Override
    @Transactional
    public void delete(Long id) {
        typeRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            typeRepository.deleteById(id);
        }
    }
}
