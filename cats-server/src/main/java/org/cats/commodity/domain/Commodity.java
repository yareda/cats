package org.cats.commodity.domain;


import org.cats.core.BaseModel;

import javax.persistence.*;

@Entity
public class Commodity extends BaseModel {

    private String name;
    private String longName;
    private String description;
    private boolean hazardous;
    private boolean coldStorageRequired;
    private double minTemperature;
    private Double maxTemperature;

    @ManyToOne
    private CommodityCategory commodityCategory;

    @ManyToOne
    private UnitOfMeasure unitOfMeasure;

    @ManyToOne
    private CommodityType commodityType;

    Commodity(){}

    public Commodity(String name,
                     String longName,
                     String description,
                     boolean hazardous,
                     boolean coldStorageRequired,
                     Double minTemperature,
                     Double maxTemperature,
                     CommodityCategory category,
                     UnitOfMeasure unitOfMeasure,
                     CommodityType commodityType){

        this.name = name;
        this.longName = longName;
        this.description = description;
        this.hazardous = hazardous;
        this.coldStorageRequired = coldStorageRequired;
        this.minTemperature = minTemperature;
        this.maxTemperature = maxTemperature;
        this.commodityCategory = category;
        this.unitOfMeasure = unitOfMeasure;
        this.commodityType = commodityType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLongName() {
        return longName;
    }

    public void setLongName(String longName) {
        this.longName = longName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isHazardous() {
        return hazardous;
    }

    public void setHazardous(boolean hazardous) {
        this.hazardous = hazardous;
    }

    public boolean isColdStorageRequired() {
        return coldStorageRequired;
    }

    public void setColdStorageRequired(boolean coldStorageRequired) {
        this.coldStorageRequired = coldStorageRequired;
    }

    public Double getMinTemperature() {
        return minTemperature;
    }

    public void setMinTemperature(Double minTemperature) {
        this.minTemperature = minTemperature;
    }

    public Double getMaxTemperature() {
        return maxTemperature;
    }

    public void setMaxTemperature(Double maxTemperature) {
        this.maxTemperature = maxTemperature;
    }

    public CommodityCategory getCategory() {
        return commodityCategory;
    }

    public void setCategory(CommodityCategory category) {
        this.commodityCategory = category;
    }

    public UnitOfMeasure getUnitOfMeasure() {
        return unitOfMeasure;
    }

    public void setUnitOfMeasure(UnitOfMeasure unitOfMeasure) {
        this.unitOfMeasure = unitOfMeasure;
    }

    public CommodityType getCommodityType() {
        return commodityType;
    }

    public void setCommodityType(CommodityType commodityType) {
        this.commodityType = commodityType;
    }

}
