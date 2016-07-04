package org.cats.commodity;

import javax.persistence.*;

@Entity
public class UnitOfMeasure {

    @Id
    @Column(name = "uom_id")
    @GeneratedValue
    private Long id;

    private String type;

    private double ratio;


    @ManyToOne
    @JoinColumn(name = "category_id")
    private UnitOfMeasureCategory category;

    UnitOfMeasure(){}


    public UnitOfMeasure(String type, double ratio, UnitOfMeasureCategory category){
        this.type = type;
        this.category = category;
        this.ratio = ratio;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getRatio() { return ratio;}

    public void setRatio(double ratio) { this.ratio = ratio;}

    public UnitOfMeasureCategory getCategory() {
        return category;
    }

    public void setCategory(UnitOfMeasureCategory category) {
        this.category = category;
    }
}
