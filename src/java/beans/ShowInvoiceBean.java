/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author divinity
 */
public class ShowInvoiceBean {
    private String invID;
    private String createdDate;
    private String firstName;
    private String lastName;
    private String address;
    private String city;
    private String totalAmount;
    private String discount;
    private String[] itemName;
    private String[] packetSize;

    public String[] getPacketSize() {
        return packetSize;
    }

    public void setPacketSize(String[] packetSize) {
        this.packetSize = packetSize;
    }

    public String[] getBatch() {
        return batch;
    }

    public void setBatch(String[] batch) {
        this.batch = batch;
    }

    public String[] getMFGDate() {
        return MFGDate;
    }

    public void setMFGDate(String[] MFGDate) {
        this.MFGDate = MFGDate;
    }

    public String[] getEXPDate() {
        return EXPDate;
    }

    public void setEXPDate(String[] EXPDate) {
        this.EXPDate = EXPDate;
    }

    public String[] getPrice() {
        return price;
    }

    public void setPrice(String[] price) {
        this.price = price;
    }

    public String[] getQnty() {
        return qnty;
    }

    public void setQnty(String[] qnty) {
        this.qnty = qnty;
    }

    public String[] getTotal() {
        return total;
    }

    public void setTotal(String[] total) {
        this.total = total;
    }
    private String[] batch;
    private String[] MFGDate;
    private String[] EXPDate;
    private String[] price;
    private String[] qnty;
    private String[] total;

    public String[] getItemName() {
        return itemName;
    }

    public void setItemName(String[] itemName) {
        this.itemName = itemName;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getVat() {
        return vat;
    }

    public void setVat(String vat) {
        this.vat = vat;
    }

    public String getFinalAmount() {
        return finalAmount;
    }

    public void setFinalAmount(String finalAmount) {
        this.finalAmount = finalAmount;
    }
    private String vat;
    private String finalAmount;

    public String getInvID() {
        return invID;
    }

    public void setInvID(String invID) {
        this.invID = invID;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
}
