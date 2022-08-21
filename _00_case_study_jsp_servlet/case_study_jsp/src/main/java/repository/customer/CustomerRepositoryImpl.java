package repository.customer;

import model.Customer;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository{
    private static final String SELECT_ALL_CUSTOMERS = "SELECT *\n" +
            "FROM customer ct JOIN customer_type ctt\n" +
            "ON ct.customer_type_id = ctt.customer_type_id";
    private static final String INSERT_CUSTOMER = "insert into customer values (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String DELETE_CUSTOMER = "delete from customer where customer_id = ?;";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT *\n" +
            "FROM customer ct JOIN customer_type ctt\n" +
            "ON ct.customer_type_id = ctt.customer_type_id\n" +
            "WHERE ct.customer_id = ?;";
    private static final String UPDATE_CUSTOMER = "update customer set customer_type_id = ?, customer_name = ?, customer_birthday= ?, customer_gender =?, customer_id_card = ?, customer_phone = ?, customer_email = ?, customer_address = ? where customer_id = ?;";
    private static final String SEARCH_CUSTOMERS = "SELECT *\n" +
            "FROM customer ct JOIN customer_type ctt\n" +
            "ON ct.customer_type_id = ctt.customer_type_id WHERE ct.customer_name LIKE ? AND ct.customer_address LIKE ?;";
    private static final String SELECT_ACTIVE_CUSTOMERS = "SELECT ct.*, ctype.customer_type_name, sv.service_name, `at`.attach_service_name\n" +
            "FROM customer ct\n" +
            "JOIN customer_type ctype ON ct.customer_type_id = ctype.customer_type_id\n" +
            "JOIN contract ctr ON ct.customer_id = ctr.customer_id\n" +
            "JOIN service sv ON ctr.service_id = sv.service_id\n" +
            "JOIN contract_detail ctd ON ctr.contract_id = ctd.contract_id\n" +
            "JOIN attach_service `at` ON ctd.attach_service_id = `at`.attach_service_id;";


    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        System.out.println(INSERT_CUSTOMER);
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER)) {
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setInt(2, customer.getTypeId());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getBirthDay());
            if (customer.getGender().equals("Male")){
                preparedStatement.setInt(5, 0);
            } else {
                preparedStatement.setInt(5, 1);
            }
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhone());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer selectCustomer(String id) {
        Customer customer = null;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);) {
            preparedStatement.setString(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int typeId = rs.getInt("customer_type_id");
                String type = rs.getString("customer_type_name");
                String name = rs.getString("customer_name");
                String birthDay = rs.getString("customer_birthday");
                String gender;
                String idCard= rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                if (rs.getInt("customer_gender") == 0){
                    gender = "Male";
                } else {
                    gender = "Female";
                }
                customer = new Customer(id, typeId, type, name, birthDay, gender, idCard, phone, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String id = rs.getString("customer_id");
                int typeId = rs.getInt("customer_type_id");
                String type = rs.getString("customer_type_name");
                String name = rs.getString("customer_name");
                String birthDay = rs.getString("customer_birthday");
                String gender;
                String idCard= rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                if (rs.getInt("customer_gender") == 0){
                    gender = "Male";
                } else {
                    gender = "Female";
                }
                customers.add(new Customer(id, typeId, type, name, birthDay, gender, idCard, phone, email, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public List<Customer> selectAllActiveCustomer() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACTIVE_CUSTOMERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String id = rs.getString("customer_id");
                int typeId = rs.getInt("customer_type_id");
                String type = rs.getString("customer_type_name");
                String name = rs.getString("customer_name");
                String birthDay = rs.getString("customer_birthday");
                String gender;
                String idCard= rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                String service = rs.getString("service_name");
                String attachService = rs.getString("attach_service_name");
                if (rs.getInt("customer_gender") == 0){
                    gender = "Male";
                } else {
                    gender = "Female";
                }
                customers.add(new Customer(id, typeId, type, name, birthDay, gender, idCard, phone, email, address, service, attachService));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public List<Customer> search(String nameSearch, String addressSearch) {
        List<Customer> customers = new ArrayList<>();

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMERS)) {
            preparedStatement.setString(1, "%" + nameSearch + "%");
            preparedStatement.setString(2, "%" + addressSearch + "%");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String id = rs.getString("customer_id");
                int typeId = rs.getInt("customer_type_id");
                String type = rs.getString("customer_type_name");
                String name = rs.getString("customer_name");
                String birthDay = rs.getString("customer_birthday");
                String gender;
                String idCard= rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                if (rs.getInt("customer_gender") == 0){
                    gender = "Male";
                } else {
                    gender = "Female";
                }
                customers.add(new Customer(id,typeId, type, name, birthDay, gender, idCard, phone, email, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public boolean deleteCustomer(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER)) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);) {
            preparedStatement.setInt(1, customer.getTypeId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthDay());
            if (customer.getGender().equals("Male")){
                preparedStatement.setInt(4, 0);
            } else {
                preparedStatement.setInt(4, 1);
            }
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setString(9, customer.getId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
