package org.cats.giftcertificate.service;

import org.cats.giftcertificate.domain.BudgetType;
import org.cats.giftcertificate.domain.Donor;
import org.cats.giftcertificate.domain.FundSource;
import org.cats.giftcertificate.domain.GiftCertificate;
import org.cats.giftcertificate.repository.BudgetTypeRepository;
import org.cats.giftcertificate.repository.DonorRepository;
import org.cats.giftcertificate.repository.FundSourceRepository;
import org.cats.giftcertificate.repository.GiftCertificateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GiftCertificateService {

    @Autowired
    private GiftCertificateRepository giftCertificateRepository;

    @Autowired
    private DonorRepository donorRepository;

    @Autowired
    private FundSourceRepository fundSourceRepository;

    @Autowired
    private BudgetTypeRepository budgetTypeRepository;

    public List<GiftCertificate> getGiftCertificatesByStatus(String status){
        return giftCertificateRepository.findByStatus(status);
    }

    public List<Donor> getDonors(){
        return donorRepository.findAll();
    }

    public List<FundSource> getFundSources(){return fundSourceRepository.findAll();}

    public List<BudgetType> getBudgetTypes(){return budgetTypeRepository.findAll();}

}
