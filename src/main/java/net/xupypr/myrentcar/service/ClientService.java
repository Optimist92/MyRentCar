package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Client;

import java.util.List;

public interface ClientService {
    Iterable<Client> findAll();

    Client findById (Long id);

    void save(Client client);

    void delete(Long id);

    void deleteSome(List<Long> ids);
}
