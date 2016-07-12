package org.cats.commodity.domain;

import org.cats.core.BaseModel;

import javax.persistence.*;
import java.util.List;

@Entity
public class CommodityCategory extends BaseModel {
    private String name;
    private String code;
    private String description;

    @ManyToOne
    private CommodityCategory parent;

    @OneToMany(mappedBy = "parent")
    private List<CommodityCategory> children;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CommodityCategory getParent() {
        return parent;
    }

    public void setParent(CommodityCategory parent) {
        this.parent = parent;
    }

    public List<CommodityCategory> getChildren() {
        return children;
    }

    public void setChildren(List<CommodityCategory> children) {
        this.children = children;
    }
}
