package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.Client;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ClientRepository extends JpaRepository<Client, Long> {
    Optional<Client> findById(Long id);
}
