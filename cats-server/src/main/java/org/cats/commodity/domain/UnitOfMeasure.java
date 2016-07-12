package org.cats.commodity.domain;

import org.cats.core.BaseModel;

import javax.persistence.*;

@Entity
public class UnitOfMeasure extends BaseModel {

    private String type;
    private String name;
    private double ratio;

    @ManyToOne
    private UomCategory uomCategory;

    UnitOfMeasure(){}

    public UnitOfMeasure(String name, String type, double ratio, UomCategory category){
        this.name = name;
        this.type = type;
        this.uomCategory = category;
        this.ratio = ratio;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getRatio() { return ratio;}

    public void setRatio(double ratio) { this.ratio = ratio;}

    public UomCategory getUomCategory() {
        return uomCategory;
    }

    public void setUomCategory(UomCategory uomCategory) {
        this.uomCategory = uomCategory;
    }
}
