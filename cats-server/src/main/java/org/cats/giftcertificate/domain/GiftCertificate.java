package org.cats.giftcertificate.domain;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

@Entity
public class GiftCertificate {
    @Id
    @Column(name = "gift_certificate_id")
    private Long id;
    private Date giftDate;
    private String referenceNo;
    private String vessel;
    private Date eta;
    private String portName;
    private String status;
    private String customsDeclarationNo;
    private String billOfLadding;
    private BigDecimal amount;
    private BigDecimal estimatedPrice;
    private BigDecimal estimatedTax;
    private String purchasedYear;
    private Date expiryDate;
    private String accountNo;

    @ManyToOne
    @JoinColumn(name = "donor_id")
    private Donor donor;

    @ManyToOne
    @JoinColumn(name = "program_id")
    private Program program;

    @ManyToOne
    @JoinColumn(name = "mode_of_transport")
    private ModeOfTransport modeOfTransport;

    @ManyToOne
    @JoinColumn(name = "budget_type")
    private BudgetType budgetType;

    @OneToMany(mappedBy = "giftCertificate")
    private Set<GiftCertificateItem> giftCertificateItems;

    GiftCertificate(){};

    public Long getId() {
        return id;
    }

    public Date getGiftDate() {
        return giftDate;
    }

    public void setGiftDate(Date giftDate) {
        this.giftDate = giftDate;
    }

    public String getReferenceNo() {
        return referenceNo;
    }

    public void setReferenceNo(String referenceNo) {
        this.referenceNo = referenceNo;
    }

    public String getVessel() {
        return vessel;
    }

    public void setVessel(String vessel) {
        this.vessel = vessel;
    }

    public Date getEta() {
        return eta;
    }

    public void setEta(Date eta) {
        this.eta = eta;
    }

    public String getPortName() {
        return portName;
    }

    public void setPortName(String portName) {
        this.portName = portName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomsDeclarationNo() {
        return customsDeclarationNo;
    }

    public void setCustomsDeclarationNo(String customsDeclarationNo) {
        this.customsDeclarationNo = customsDeclarationNo;
    }

    public String getBillOfLadding() {
        return billOfLadding;
    }

    public void setBillOfLadding(String billOfLadding) {
        this.billOfLadding = billOfLadding;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getEstimatedPrice() {
        return estimatedPrice;
    }

    public void setEstimatedPrice(BigDecimal estimatedPrice) {
        this.estimatedPrice = estimatedPrice;
    }

    public BigDecimal getEstimatedTax() {
        return estimatedTax;
    }

    public void setEstimatedTax(BigDecimal estimatedTax) {
        this.estimatedTax = estimatedTax;
    }

    public String getPurchasedYear() {
        return purchasedYear;
    }

    public void setPurchasedYear(String purchasedYear) {
        this.purchasedYear = purchasedYear;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public Donor getDonor() {
        return donor;
    }

    public void setDonor(Donor donor) {
        this.donor = donor;
    }

    public Program getProgram() {
        return program;
    }

    public void setProgram(Program program) {
        this.program = program;
    }

    public ModeOfTransport getModeOfTransport() {
        return modeOfTransport;
    }

    public void setModeOfTransport(ModeOfTransport modeOfTransport) {
        this.modeOfTransport = modeOfTransport;
    }

    public BudgetType getBudgetType() {
        return budgetType;
    }

    public void setBudgetType(BudgetType budgetType) {
        this.budgetType = budgetType;
    }

    public Set<GiftCertificateItem> getGiftCertificateItems() {
        return giftCertificateItems;
    }

    public void setGiftCertificateItems(Set<GiftCertificateItem> giftCertificateItems) {
        this.giftCertificateItems = giftCertificateItems;
    }

}
