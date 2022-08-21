package repository.service;

import model.RentType;
import model.Service;
import model.ServiceType;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements IServiceRepository {
    private static final String SELECT_ALL_SERVICE = "SELECT sv.*, st.service_type_name, rt.rent_type_name\n" +
            "FROM service sv\n" +
            "JOIN service_type st ON sv.service_type_id = st.service_type_id\n" +
            "JOIN rent_type rt ON sv.rent_type_id = rt.rent_type_id;";
    private static final String INSERT_SERVICE = "INSERT INTO service (service_name, service_area, service_cost, " +
            "service_max_people, rent_type_id, service_type_id, stardard_room, description_other_convenience, " +
            "pool_area, number_of_floors)\n" +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,?);";
    private static final String SELECT_ALL_SERVICE_TYPE = "SELECT * FROM service_type;";
    private static final String SELECT_ALL_RENT_TYPE_TYPE = "SELECT * FROM rent_type;";

    public void insertService(Service service) throws SQLException {
        System.out.println(INSERT_SERVICE);
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE)) {
            preparedStatement.setString(1, service.getName());
            preparedStatement.setInt(2, service.getArea());
            preparedStatement.setDouble(3, service.getCost());
            preparedStatement.setInt(4, service.getMaxPeople());
            preparedStatement.setInt(5, service.getRentTypeId());
            preparedStatement.setInt(6, service.getServiceTypeId());
            preparedStatement.setString(7, service.getStandardRoom());
            preparedStatement.setString(8, service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, service.getPoolArea());
            preparedStatement.setInt(10, service.getNumberOfFloors());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Service selectService(int id) {
        return null;
    }

    @Override
    public List<Service> selectAllService() {
        List<Service> services = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String id = rs.getString("service_id");
                String name = rs.getString("service_name");
                int area = rs.getInt("service_area");
                double cost= rs.getDouble("service_cost");
                int maxPeople = rs.getInt("service_max_people");
                int rentTypeId = rs.getInt("rent_type_id");
                String rentTypeName = rs.getString("rent_type_name");
                int serviceTypeId = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                String standardRoom = rs.getString("standard_room");
                String des = rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int numberOfFloors = rs.getInt("number_of_floors");

                services.add(new Service(id, name, area, cost, maxPeople, rentTypeId, rentTypeName, serviceTypeId,
                        serviceTypeName, standardRoom, des, poolArea, numberOfFloors));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    @Override
    public List<ServiceType> selectAllServiceType() {
        List<ServiceType> serviceTypes = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_TYPE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("service_type_id");
                String name = rs.getString("service_type_name");

                serviceTypes.add(new ServiceType(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceTypes;
    }

    @Override
    public List<RentType> selectAllRentType() {
        List<RentType> rentTypes = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE_TYPE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("rent_type_id");
                String name = rs.getString("rent_type_name");
                double cost = rs.getDouble("rent_type_cost");

                rentTypes.add(new RentType(id, name, cost));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypes;
    }

    @Override
    public List<Service> search(String name, String address) {
        return null;
    }

    @Override
    public boolean deleteService(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateService(Service service) throws SQLException {
        return false;
    }

}
