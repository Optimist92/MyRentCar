package net.xupypr.myrentcar.service;

import net.xupypr.myrentcar.domain.Client;
import net.xupypr.myrentcar.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public ClientServiceImpl(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    @Override
    @Transactional
    public Iterable<Client> findAll() {
        return clientRepository.findAll();
    }

    @Override
    @Transactional
    public Client findById(Long id) {
        Optional<Client> client = clientRepository.findById(id);
        return client.isPresent() ? client.get() : null;
    }

    @Override
    @Transactional
    public void save(Client client) {
        clientRepository.save(client);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        clientRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteSome(List<Long> ids) {
        for(Long id: ids) {
            clientRepository.deleteById(id);
        }
    }
}
