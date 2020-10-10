package net.xupypr.myrentcar.service;


import net.xupypr.myrentcar.domain.Transmission;

import java.util.List;

public interface TransmissionService {
    Iterable<Transmission> findAll();// throws LogicException;

    Transmission findById (Long id);// throws LogicException;

    void save(Transmission transmission);// throws LogicException;

    void delete(Long id);// throws LogicException;

    void deleteSome(List<Long> ids);// throws LogicException;
}
