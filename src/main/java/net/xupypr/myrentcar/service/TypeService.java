package net.xupypr.myrentcar.service;


import net.xupypr.myrentcar.domain.Type;

import java.util.List;

public interface TypeService {
    Iterable<Type> findAll();// throws LogicException;

    Type findById (Long id);// throws LogicException;

    void save(Type type);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;
}
