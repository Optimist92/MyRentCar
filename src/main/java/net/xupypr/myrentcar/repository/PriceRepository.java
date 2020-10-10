package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.Price;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PriceRepository extends JpaRepository<Price, Long> {
}
