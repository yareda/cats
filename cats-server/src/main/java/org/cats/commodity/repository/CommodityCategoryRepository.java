package org.cats.commodity.repository;

import org.cats.commodity.domain.CommodityCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommodityCategoryRepository extends JpaRepository<CommodityCategory, Long> {}
