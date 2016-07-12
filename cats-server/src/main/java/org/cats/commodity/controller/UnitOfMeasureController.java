package org.cats.commodity.controller;

import org.cats.commodity.domain.UnitOfMeasure;
import org.cats.commodity.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.annotation.HttpMethodConstraint;
import java.util.List;

@RestController
@RequestMapping(value = "api/uom")
public class UnitOfMeasureController {

    @Autowired
    CommodityService commodityService;

    @RequestMapping(value = "**/", params = "category")
    public List<UnitOfMeasure> list(){
        return commodityService.getUnitOfMeasures();
    }
}
