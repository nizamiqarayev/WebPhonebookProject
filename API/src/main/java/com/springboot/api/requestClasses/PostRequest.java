package com.springboot.api.requestClasses;

import javax.persistence.*;

public class PostRequest {
    private String firstName;
    private String lastName;
    private long number;
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setNumber(long number) {
        this.number = number;
    }


    public String getFirstName() {
        return this.firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public long getNumber() {
        return this.number;
    }


}
