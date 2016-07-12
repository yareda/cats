package org.cats.giftcertificate.domain;

import org.cats.core.BaseModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Donor extends BaseModel {
    @Column(unique = true)
    private String name;
    private String shortName;
    private String code;
    private Boolean sourceDonor;
    private Boolean responsibleDonor;

    Donor(){}

    public Donor(String name, String shortName, String code, boolean sourceDonor, boolean responsibleDonor){
        this.name = name;
        this.shortName = shortName;
        this.code = code;
        this.sourceDonor = sourceDonor;
        this.responsibleDonor = responsibleDonor;
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

    public Boolean isSourceDonor() {
        return sourceDonor;
    }

    public void setSourceDonor(Boolean sourceDonor) {
        this.sourceDonor = sourceDonor;
    }

    public Boolean isResponsibleDonor() {
        return responsibleDonor;
    }

    public void setResponsibleDonor(Boolean responsibleDonor) {
        this.responsibleDonor = responsibleDonor;
    }
}
