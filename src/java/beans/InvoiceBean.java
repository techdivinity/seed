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
public class InvoiceBean 
{
    private String custID;
    private String totalAmount;
    private String discount;
    private String vat;
    private String finalAmount;
    private String[] itemIds;
    private String[] price;
    private String[] qnty;

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
    private String[] total;

    public String getCustID() {
        return custID;
    }

    public void setCustID(String custID) {
        this.custID = custID;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String[] getItemIds() {
        return itemIds;
    }

    public void setItemIds(String[] itemIds) {
        this.itemIds = itemIds;
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
    
    
}
