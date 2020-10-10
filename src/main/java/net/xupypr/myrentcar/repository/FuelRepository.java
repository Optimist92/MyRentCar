package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.Fuel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FuelRepository extends JpaRepository<Fuel, Long> {
}
