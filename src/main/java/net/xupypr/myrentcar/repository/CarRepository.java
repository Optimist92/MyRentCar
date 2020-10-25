package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.Car;
import org.hibernate.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    @Query(value = "SELECT c FROM Car c WHERE c.description LIKE %?1%")
    List<Car> searchCarDesc(String request);

    @Query(value = "SELECT c FROM Car c WHERE c.color LIKE %?1%")
    List<Car> searchCarColor(String request);

    @Query(value = "SELECT c FROM Car c WHERE c.regNumberAuto LIKE %?1%")
    List<Car> searchCarReg(String request);

}
