package org.cats.commodity;


import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
public class Commodity {
    @Id
    @Column(name = "commodity_id")
    @GeneratedValue()
    private Long id;

    private String name;
    private String longName;
    private String description;
    private boolean hazardous;
    private boolean coldStorageRequired;
    private double minTemperature;
    private Double maxTemperature;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CommodityCategory category;

    @ManyToOne
    @JoinColumn(name = "uom_id")
    private UnitOfMeasure unitOfMeasure;

    @ManyToOne
    @JoinColumn(name = "commodity_category_id")
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
        this.category = category;
        this.unitOfMeasure = unitOfMeasure;
        this.commodityType = commodityType;
    }

    public Long getId() {
        return id;
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
        return category;
    }

    public void setCategory(CommodityCategory category) {
        this.category = category;
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
