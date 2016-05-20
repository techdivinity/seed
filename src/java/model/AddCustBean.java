/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author admin
 */
public class AddCustBean {
    private String custId;
    private String FirstName;
    private String LastName;
    private String phnumber;
    private String Address;
    private String City;
    private String Email;
    private String TINNO;
    private String CSTNO;
    
    public String getcustId()
    { 
        return custId;
    }
    public void  setcustId(String custId){
        this.custId=custId;
    }
    public String getFirstName()
    {
        return FirstName;
    }
    public void setFirstName(String FirstName)
    {
        this.FirstName=FirstName;
    }
    public String getLastName()
    {
        return LastName;
    }
    public void setLastName(String LastName)
    {
        this.LastName=LastName;
    }
    
     public String getphnumber()
    {
        return phnumber;
    }
    public void setphnumber(String phnumber)
    {
        this.phnumber=phnumber;
    }
    public String getAddress()
    {
        return Address;
    }
    public void setAddress(String Address)
    {
        this.Address=Address;
    }
    
    public String getCity()
    {
        return City;
    }
    public void setCity(String City)
    {
        this.City=City;
    }
    
    public String getEmail()
    {
        return Email;
    }
    public void setEmail(String Email)
    {
        this.Email=Email;
    }
    
    public String getTINNO()
    {
        return TINNO;
    }
    public void setTINNO(String TINNO)
    {
        this.TINNO=TINNO;
    }
    public String getCSTNO()
    {
        return CSTNO;
    }
    public void setCSTNO(String CSTNO)
    {
        this.CSTNO=CSTNO;
    }
        
}
