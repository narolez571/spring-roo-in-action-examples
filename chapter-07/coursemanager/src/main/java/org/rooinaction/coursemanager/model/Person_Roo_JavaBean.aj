// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.model;

import java.lang.String;

privileged aspect Person_Roo_JavaBean {
    
    public String Person.getFirstName() {
        return this.firstName;
    }
    
    public void Person.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Person.getMiddleNameOrInitial() {
        return this.middleNameOrInitial;
    }
    
    public void Person.setMiddleNameOrInitial(String middleNameOrInitial) {
        this.middleNameOrInitial = middleNameOrInitial;
    }
    
    public String Person.getLastName() {
        return this.lastName;
    }
    
    public void Person.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String Person.getAddressLine1() {
        return this.addressLine1;
    }
    
    public void Person.setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }
    
    public String Person.getAddressLine2() {
        return this.addressLine2;
    }
    
    public void Person.setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }
    
    public String Person.getCity() {
        return this.city;
    }
    
    public void Person.setCity(String city) {
        this.city = city;
    }
    
    public String Person.getStateCode() {
        return this.stateCode;
    }
    
    public void Person.setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }
    
    public String Person.getPostalCode() {
        return this.postalCode;
    }
    
    public void Person.setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
    
    public String Person.getEmailAddress() {
        return this.emailAddress;
    }
    
    public void Person.setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    
}
