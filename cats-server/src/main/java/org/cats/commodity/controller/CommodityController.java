package org.cats.commodity.controller;

import org.cats.commodity.domain.CommodityType;
import org.cats.commodity.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping(value="api/commodity")
public class CommodityController {

    @Autowired
    CommodityService commodityService;


    @RequestMapping("**/type")
    public List<CommodityType> commodityTypes(){return commodityService.getCommodityTypes();}

}
