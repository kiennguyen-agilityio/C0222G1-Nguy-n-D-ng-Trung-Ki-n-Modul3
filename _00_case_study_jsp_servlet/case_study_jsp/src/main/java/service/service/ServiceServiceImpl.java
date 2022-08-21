package service.service;

import model.RentType;
import model.Service;
import model.ServiceType;
import repository.service.IServiceRepository;
import repository.service.ServiceRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ServiceServiceImpl implements IServiceService{
    private IServiceRepository serviceRepository = new ServiceRepositoryImpl();

    @Override
    public void insertService(Service service) throws SQLException {
        serviceRepository.insertService(service);
    }

    @Override
    public Service selectService(int id) {
        return serviceRepository.selectService(id);
    }

    @Override
    public List<Service> selectAllService() {
        return serviceRepository.selectAllService();
    }

    @Override
    public List<Service> search(String name, String address) {
        return serviceRepository.search(name, address);
    }

    @Override
    public boolean deleteService(int id) throws SQLException {
        return serviceRepository.deleteService(id);
    }

    @Override
    public boolean updateService(Service service) throws SQLException {
        return serviceRepository.updateService(service);
    }

    @Override
    public List<ServiceType> selectAllServiceType() {
        return serviceRepository.selectAllServiceType();
    }

    @Override
    public List<RentType> selectAllRentType() {
        return serviceRepository.selectAllRentType();
    }
}
