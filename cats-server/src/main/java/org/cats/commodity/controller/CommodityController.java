package org.cats.commodity.controller;

import org.cats.commodity.domain.CommodityCategory;
import org.cats.commodity.domain.CommodityType;
import org.cats.commodity.domain.UnitOfMeasure;
import org.cats.commodity.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping(value="commodity")
public class CommodityController {

    @Autowired
    CommodityService commodityService;

    @RequestMapping("**/uom")
    public List<UnitOfMeasure> uom(){
        return commodityService.getUnitOfMeasures();
    }

    @RequestMapping("**/commoditycategory")
    public List<CommodityCategory> commodityCategories(){
        return commodityService.getCommodityCategories();
    }

    @RequestMapping("**/commoditytype")
    public List<CommodityType> commodityTypes(){return commodityService.getCommodityTypes();}

}
