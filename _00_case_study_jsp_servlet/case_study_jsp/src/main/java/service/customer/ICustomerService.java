package service.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    void insertCustomer(Customer customer) throws SQLException;

    Customer selectCustomer(String id);

    List<Customer> selectAllCustomer();

    List<Customer> selectAllActiveCustomer();

    List<Customer> search(String name, String address);

    boolean deleteCustomer(String id) throws SQLException;

    boolean updateCustomer(Customer customer) throws SQLException;

    boolean checkRegex(String string);


    boolean checkRegexId(String id);
    boolean checkRegexIdCard(String idCard);
    boolean checkRegexPhone(String phone);
}
