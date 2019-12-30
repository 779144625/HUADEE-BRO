package com.hwadee.model;


import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

public class User {
    private int id;
    @NotBlank
    private String user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
}

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Length(min=8,max=16)
    private String password;
}
