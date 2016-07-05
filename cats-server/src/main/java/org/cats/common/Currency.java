package org.cats.common;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Currency {
    @Id
    private Long id;
    private String name;
    private String symbol;

    public Long getId() {
        return id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }
}
