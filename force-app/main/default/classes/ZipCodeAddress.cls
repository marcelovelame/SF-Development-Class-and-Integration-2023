/**
 * @author: mvelame - Salesforce
 */

public with sharing class ZipCodeAddress {

    public String street;
    public String city;
    public String state;
    public String streetNumber;
    public String zipCode;

    override
    public String toString () {
        return JSON.serialize(this);
    }
    
}