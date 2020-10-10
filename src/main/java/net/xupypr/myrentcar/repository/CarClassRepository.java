package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.CarClass;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarClassRepository extends JpaRepository<CarClass, Long> {
}
