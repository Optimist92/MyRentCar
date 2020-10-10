package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<Car, Long> {
}
