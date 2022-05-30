package model;

public class Product {
    private int id  ;
    private String name ;
    private int price ;
    private int status;
    private String dateProduce;

    public Product() {
    }

    public Product(int id, String name, int price, int status, String dateProduce) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.status = status;
        this.dateProduce = dateProduce;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDateProduce() {
        return dateProduce;
    }

    public void setDateProduce(String dateProduce) {
        this.dateProduce = dateProduce;
    }
}
