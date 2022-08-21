package service.customer;

import model.Customer;
import model.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerTypeService {
    void insertCustomerType(CustomerType customerType) throws SQLException;

    CustomerType selectCustomerType(int id);

    List<CustomerType> selectAllCustomerType();

    List<CustomerType> sortByName();

}
