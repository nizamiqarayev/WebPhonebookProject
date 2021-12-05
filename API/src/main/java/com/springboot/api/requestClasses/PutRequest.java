package com.springboot.api.requestClasses;

import javax.persistence.*;

public class PutRequest {
    private long id;
    private String firstName;
    private String lastName;
    private long number;

    public long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public long getNumber() {
        return number;
    }


}
