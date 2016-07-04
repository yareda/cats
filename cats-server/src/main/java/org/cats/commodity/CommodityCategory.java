package org.cats.commodity;

import javax.persistence.*;
import java.util.List;

@Entity
public class CommodityCategory {
    @Id
    @Column(name = "category_id")
    @GeneratedValue()
    private long id;
    private String name;
    private String code;
    private String description;

    @ManyToOne
    private CommodityCategory parent;

    @OneToMany(mappedBy = "parent")
    private List<CommodityCategory> children;

    public long getId() {
        return id;
    }

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
