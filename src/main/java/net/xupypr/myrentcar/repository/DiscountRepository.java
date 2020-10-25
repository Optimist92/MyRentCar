package net.xupypr.myrentcar.repository;

import net.xupypr.myrentcar.domain.Discount;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiscountRepository extends JpaRepository<Discount, Long> {
}
