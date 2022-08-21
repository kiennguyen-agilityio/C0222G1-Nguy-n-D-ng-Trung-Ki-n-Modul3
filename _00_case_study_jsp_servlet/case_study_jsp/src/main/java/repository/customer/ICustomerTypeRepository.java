package repository.customer;

import model.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerTypeRepository {
    void insertCustomerType(CustomerType customerType) throws SQLException;

    CustomerType selectCustomerType(int id);

    List<CustomerType> selectAllCustomerType();

    List<CustomerType> sortByName();
}
