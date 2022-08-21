package model;

public class AttachService {
    private int id;
    private String name;
    private double cost;
    private int unit;
    private boolean status;

    public AttachService(String name, double cost, int unit, boolean status) {
        this.name = name;
        this.cost = cost;
        this.unit = unit;
        this.status = status;
    }


    public AttachService(int id, String name, double cost, int unit, boolean status) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.unit = unit;
        this.status = status;
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

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
