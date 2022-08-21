package service.customer;

import model.Customer;
import repository.customer.CustomerRepositoryImpl;
import repository.customer.ICustomerRepository;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService{
    private static final String REGEX_CUSTOMER_ID = "(KH)[-][\\d]{4}";
    private static final String REGEX_CUSTOMER_ID_CARD = "[\\d]{9}";
    private static final String REGEX_CUSTOMER_PHONE = "(090)[\\d]{7}|(091)[\\d]{7}";
    private static final String REGEX_CUSTOMER_EMAIL = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    private ICustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public void insertCustomer(Customer customer) throws SQLException {
           customerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(String id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public List<Customer> selectAllActiveCustomer() {
        return customerRepository.selectAllActiveCustomer();
    }

    @Override
    public List<Customer> search(String name, String address) {
        return customerRepository.search(name, address);
    }

    @Override
    public boolean deleteCustomer(String id) throws SQLException {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean checkRegex(String string) {
        return false;
    }

    public boolean checkRegexId(String id){
        if (id.matches(REGEX_CUSTOMER_ID)){
            return true;
        } else {
            return false;
        }
    }
    public boolean checkRegexIdCard(String idCard){
        if (idCard.matches(REGEX_CUSTOMER_ID_CARD)){
            return true;
        } else {
            return false;
        }
    }
    public boolean checkRegexPhone(String phone){
        if (phone.matches(REGEX_CUSTOMER_PHONE)){
            return true;
        } else {
            return false;
        }
    }
    public boolean checkRegexEmail(String email){
        if (email.matches(REGEX_CUSTOMER_EMAIL)){
            return true;
        } else {
            return false;
        }
    }
}
