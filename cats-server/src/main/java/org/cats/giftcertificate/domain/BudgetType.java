package org.cats.giftcertificate.domain;

import javax.persistence.*;

@Entity
public class BudgetType {
    @Id
    @Column(name = "budget_type_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String description;

    BudgetType(){}

    public BudgetType(String name, String description){
        this.name = name;
        this.description = description;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
