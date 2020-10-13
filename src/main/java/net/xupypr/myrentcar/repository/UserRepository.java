package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
