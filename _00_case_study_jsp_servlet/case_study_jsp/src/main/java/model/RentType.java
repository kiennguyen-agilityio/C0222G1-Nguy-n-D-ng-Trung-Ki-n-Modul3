package model;

public class RentType {
    private int rentTypeId;
    private String rentTypeName;
    private double cost;

    public RentType(int rentTypeId, String rentTypeName, double cost) {
        this.rentTypeId = rentTypeId;
        this.rentTypeName = rentTypeName;
        this.cost = cost;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public String getRentTypeName() {
        return rentTypeName;
    }

    public void setRentTypeName(String rentTypeName) {
        this.rentTypeName = rentTypeName;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }
}
