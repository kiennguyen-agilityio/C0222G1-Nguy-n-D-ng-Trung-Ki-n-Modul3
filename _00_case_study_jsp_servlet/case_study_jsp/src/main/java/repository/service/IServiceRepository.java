package repository.service;

import model.Employee;
import model.RentType;
import model.Service;
import model.ServiceType;

import java.sql.SQLException;
import java.util.List;

public interface IServiceRepository {
    void insertService(Service service) throws SQLException;

    Service selectService(int id);

    List<Service> selectAllService();

    List<ServiceType> selectAllServiceType();

    List<RentType> selectAllRentType();

    List<Service> search(String name, String address);

    boolean deleteService(int id) throws SQLException;

    boolean updateService(Service service) throws SQLException;

}
