package org.cats.commodity.service;

import org.cats.commodity.domain.Commodity;
import org.cats.commodity.domain.CommodityType;
import org.cats.commodity.domain.UnitOfMeasure;
import org.cats.commodity.repository.CommodityRepository;
import org.cats.commodity.repository.CommodityTypeRepository;
import org.cats.commodity.repository.UnitOfMeasureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityService {

    @Autowired
    CommodityRepository commodityRepository;

    @Autowired
    UnitOfMeasureRepository unitOfMeasureRepository;

    @Autowired
    CommodityTypeRepository commodityTypeRepository;


    public void addCommodity(Commodity commodity){
        commodityRepository.save(commodity);
    }

    public List<UnitOfMeasure> getUnitOfMeasures(){
        return unitOfMeasureRepository.findAll();
    }

    public List<CommodityType> getCommodityTypes(){return commodityTypeRepository.findAll();}

}
