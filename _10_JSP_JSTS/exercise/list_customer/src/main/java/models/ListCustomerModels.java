package models;

import java.awt.*;

public class ListCustomerModels {
    private String name ;
    private String dateOfBirth;
    private String Address ;
    private String path ;

    public ListCustomerModels() {
    }

    public ListCustomerModels(String name, String dateOfBirth, String address, String path) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        Address = address;
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "ListCustomerModels{" +
                "name='" + name + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", Address='" + Address + '\'' +
                ", img=" + path +
                '}';
    }
}