package org.cats.giftcertificate.repository;

import org.cats.giftcertificate.domain.Donor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DonorRepository extends JpaRepository<Donor,Long> {}
