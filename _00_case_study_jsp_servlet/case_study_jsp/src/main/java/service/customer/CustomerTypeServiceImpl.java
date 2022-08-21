package service.customer;

import model.Customer;
import model.CustomerType;
import repository.customer.CustomerTypeRepository;
import repository.customer.ICustomerTypeRepository;

import java.sql.SQLException;
import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService{
    ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();

    @Override
    public void insertCustomerType(CustomerType customerType) throws SQLException {

    }

    @Override
    public CustomerType selectCustomerType(int id) {
        return null;
    }

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return customerTypeRepository.selectAllCustomerType();
    }

    @Override
    public List<CustomerType> sortByName() {
        return null;
    }
}
