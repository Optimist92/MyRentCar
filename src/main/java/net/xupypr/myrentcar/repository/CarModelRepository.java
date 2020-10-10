package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.CarModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarModelRepository extends JpaRepository<CarModel, Long> {
}
