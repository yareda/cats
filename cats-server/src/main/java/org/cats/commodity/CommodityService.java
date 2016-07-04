package org.cats.commodity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityService {

    @Autowired
    CommodityRepository commodityRepository;

    @Autowired
    UnitOfMeasureRepository unitOfMeasureRepository;

    public void addCommodity(Commodity commodity){
        commodityRepository.save(commodity);
    }

    public List<UnitOfMeasure> getUnitOfMeasures(){
        return unitOfMeasureRepository.findAll();
    }

}
