package org.cats.giftcertificate.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Donor {
    @Id
    @Column(name = "donor_id")
    private Long id;
    private String name;
    private String shortName;
    private String code;
    private boolean sourceDonor;
    private boolean responsibleDonor;

    Donor(){}

    public Donor(String name, String shortName, String code, boolean sourceDonor, boolean responsibleDonor){
        this.name = name;
        this.shortName = shortName;
        this.code = code;
        this.sourceDonor = sourceDonor;
        this.responsibleDonor = responsibleDonor;
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

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isSourceDonor() {
        return sourceDonor;
    }

    public void setSourceDonor(boolean sourceDonor) {
        this.sourceDonor = sourceDonor;
    }

    public boolean isResponsibleDonor() {
        return responsibleDonor;
    }

    public void setResponsibleDonor(boolean responsibleDonor) {
        this.responsibleDonor = responsibleDonor;
    }
}
